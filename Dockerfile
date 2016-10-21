FROM centos:7
# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN yum -y install wget openssh-server; yum clean all && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint /
COPY README.md /

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
