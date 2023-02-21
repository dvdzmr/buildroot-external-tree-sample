################################################################################
#
# python_pypi
#
################################################################################

PYTHON_PYPI_VERSION = 1.00.0
PYTHON_PYPI_SOURCE = python_pypi-$(PYTHON_PYPI_VERSION).tar.gz
PYTHON_PYPI_SITE = https://
PYTHON_PYPI_SETUP_TYPE = setuptools
PYTHON_PYPI_LICENSE = MIT
PYTHON_PYPI_LICENSE_FILES = LICENSE

$(eval $(python-package))