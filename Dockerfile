FROM            centos:8.2.2004
MAINTAINER      efocht
ADD             dnf.conf /etc/dnf
ADD             CentOS-Base.repo /etc/yum.repos.d
ADD             CentOS-Extras.repo /etc/yum.repos.d
ADD             CentOS-AppStream.repo /etc/yum.repos.d
ADD             https://www.hpc.nec/repos/TSUBASA-soft-release-2.3-1.noarch.rpm /tmp
ADD             TSUBASA-repo.repo /tmp
ADD             sxaurora.repo /tmp
ARG             RELEASE_RPM=/tmp/TSUBASA-soft-release-*.noarch.rpm
RUN             yum -y install $RELEASE_RPM ; \
                cp /tmp/*.repo /etc/yum.repos.d ; \
                rm /tmp/*.repo /tmp/*.rpm ; \
                yum clean all 
#RUN             yum -y group install ve-container nec-sdk-runtime ; \
RUN             yum -y install llvm-ve-1.20.0 llvm-ve-link-1.20.0
ADD		llvmvervvars.sh /opt/nec/nosupport
#ENV            LOG4C_RCPATH=/etc/opt/nec/ve/veos
CMD             ["/bin/bash"]
