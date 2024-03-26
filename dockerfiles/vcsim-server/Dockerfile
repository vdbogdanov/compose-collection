FROM golang:1.22.1
COPY govc-recordings /opt/vcsim_data/
RUN go install github.com/vmware/govmomi/vcsim@latest
RUN go install github.com/vmware/govmomi/govc@latest
RUN echo "export GOVC_URL=https://user:pass@127.0.0.1:8989/sdk" >> /root/.bashrc
RUN echo "export GOVC_INSECURE=1" >> /root/.bashrc
EXPOSE 8989/tcp
CMD ["/go/bin/vcsim", "-l", "0.0.0.0:8989", "-load", "/opt/vcsim_data/vcsim-vmcvcenter.sddc-35-193-232-224.vmwarevmc.com"]