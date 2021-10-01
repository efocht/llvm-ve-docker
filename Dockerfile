FROM            efocht/ve-base-dev:veos2.8.3
MAINTAINER      efocht
#ENV             LLVM_VE_LOC=https://sx-aurora.com/repos/llvm/x86_64
ENV             LLVM_VE_NAME=llvm-ve-rv-1.9.2-1.9.2-1.el8
RUN             yum -y install ${LLVM_VE_NAME} ; \
                  yum clean all; rm -rf /var/cache/yum/* ; \
                  ln -s /usr/local/ve/llvm-ve-rv-1.9.2 /usr/local/ve/llvm
#ENV            LOG4C_RCPATH=/etc/opt/nec/ve/veos
CMD             ["/bin/bash"]
