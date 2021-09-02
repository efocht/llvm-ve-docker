FROM            centos:8.3.2011
#FROM            efocht/base-ve-centos83:2.8.3
MAINTAINER      efocht
ENV             LLVM_VE_TAR_DIR=https://sx-aurora.com/repos/llvm/tars
ENV             LLVM_VE_TAR_NAME=llvm-ve-rv-1.9b3.tar.gz
ADD             dnf.conf /etc/dnf
ADD             CentOS-Base.repo /etc/yum.repos.d
ADD             CentOS-Extras.repo /etc/yum.repos.d
ADD             CentOS-AppStream.repo /etc/yum.repos.d
ADD             https://www.hpc.nec/repos/TSUBASA-soft-release-2.3-1.noarch.rpm /tmp
ADD             TSUBASA-repo.repo /tmp
ADD             sxaurora.repo /tmp
ARG             RELEASE_RPM=/tmp/TSUBASA-soft-release-*.noarch.rpm

RUN \
                yum -y install $RELEASE_RPM ; \
                cp /tmp/*.repo /etc/yum.repos.d ; \
                rm /tmp/*.repo /tmp/*.rpm ; \
                yum clean all ; \
                yum -y install \
                    vim git unzip wget glibc-ve glibc-ve-devel elfutils-libelf-devel \
                    binutils-ve kheaders-ve libstdc++ glibc libgcc binutils \
                    gcc-toolset-10-libstdc++-devel veoffload-aveorun-devel \
                    veos-devel veoffload-aveo-devel veosinfo-devel ; \
                yum clean all ; \
                mkdir -p /usr/local/ve ; \
                wget ${LLVM_VE_TAR_DIR}/${LLVM_VE_TAR_NAME} && \
                tar -xzf ${LLVM_VE_TAR_NAME} ; rm -f ${LLVM_VE_TAR_NAME}
ADD		llvmvervvars.sh /usr/local/ve/${LLVM_VE_TAR_NAME}/bin
#ENV            LOG4C_RCPATH=/etc/opt/nec/ve/veos
CMD             ["/bin/bash"]
