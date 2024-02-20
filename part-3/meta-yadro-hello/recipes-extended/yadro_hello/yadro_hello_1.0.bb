SUMMARY = "A program that prints 'Hello from my own program!'"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
SRC_URI = "file://yadro-hello.c"
S = "${WORKDIR}"
do_compile() {
    ${CC} ${CFLAGS} yadro-hello.c -o yadro-hello
}
do_install() {
    install -d ${D}${bindir}
    install -m 0755 yadro-hello ${D}${bindir}/yadro-hello
}
FILES_${PN} += "${bindir}/yadro-hello"
inherit pkgconfig