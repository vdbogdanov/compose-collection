FROM redhat/ubi8:8.9
ENV TZ="Europe/Moscow"
RUN dnf -y update
RUN dnf install -y vim curl sshpass iputils net-tools nmap zip git python39
RUN python3 -m pip install ansible
RUN python3 -m pip install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git
RUN mkdir /opt/ansible
VOLUME ["/opt/ansible"]
CMD ["bash"]