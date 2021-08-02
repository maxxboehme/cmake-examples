# DEB Specific Package Variables

# If you require any packages to be installed you should list them here
# Example: "libc6 (>= 2.3.1-6), libc6 (< 2.4)"
# A Depends filed taks effect only when a package is to be configured.
# It does not prevent a package being on the system in an unconfigured state
# whilte its dependencies are unsatisfied.
SET(CPACK_DEBIAN_PACKAGE_DEPENDS "")
# Like Depends, except that it also forces the complete installation of the packages named
# before even starting the installation of the package which declares the pre-dependency.
SET(CPACK_DEBIAN_PACKAGE_PREDEPENDS "")
