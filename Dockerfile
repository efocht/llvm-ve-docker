FROM            efocht/ve-base-dev:veos2.8.3
MAINTAINER      efocht
ENV             LLVM_VE_TAR_DIR=https://sx-aurora.com/repos/llvm/tars
ENV             LLVM_VE_NAME=llvm-ve-rv-1.9b3
# download and install llvm-ve-rv tarball
RUN             wget ${LLVM_VE_TAR_DIR}/${LLVM_VE_NAME}-el8.tar.gz && \
                tar -xzf ${LLVM_VE_NAME}-el8.tar.gz ; rm -f ${LLVM_VE_NAME}-el8.tar.gz; \
                ln -s /usr/local/ve/${LLVM_VE_NAME} /usr/local/ve/llvm-ve
ADD		llvmvervvars.sh /usr/local/ve/${LLVM_VE_NAME}/bin
#ENV            LOG4C_RCPATH=/etc/opt/nec/ve/veos
CMD             ["/bin/bash"]
