###########################################################################
#
# PYTHON_LOCAL (python package example using local files)
#
###########################################################################

PYTHON_LOCAL_VERSION = 2.6
PYTHON_LOCAL_SITE = $(BR2_EXTERNAL_DVDZMR_PATH)/package/PYTHON_LOCAL/dist
PYTHON_LOCAL_SITE_METHOD = local
PYTHON_LOCAL_SETUP_TYPE= setuptools


$(eval $(python-package))