if [ "${BUILD_FLAG}" = "build_yocto" ]; then \
cd poky && source "${BUILD_DIR}"/poky/oe-init-build-env build && \ 
bitbake core-image-minimal; \
elif [ "${BUILD_FLAG}" = "run_yocto" ]; then \
cd "${BUILD_DIR}"/poky && runqemu qemux86-64; \ 
fi