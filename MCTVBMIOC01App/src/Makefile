TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = MCTVBMIOC01
# MCTVBMIOC01.dbd will be created and installed
DBD += MCTVBMIOC01.dbd

# MCTVBMIOC01.dbd will be made up from these files:
MCTVBMIOC01_DBD += base.dbd

# Include dbd files from all support applications:
MCTVBMIOC01_DBD += asyn.dbd
MCTVBMIOC01_DBD += busySupport.dbd
MCTVBMIOC01_DBD += calcSupport.dbd
MCTVBMIOC01_DBD += motorSupport.dbd
MCTVBMIOC01_DBD += devSoftMotor.dbd
MCTVBMIOC01_DBD += asSupport.dbd
MCTVBMIOC01_DBD += IocStat.dbd

# Add all the support libraries needed by this IOC
MCTVBMIOC01_LIBS += asyn
MCTVBMIOC01_LIBS += busy
MCTVBMIOC01_LIBS += motor
MCTVBMIOC01_LIBS += softMotor
MCTVBMIOC01_LIBS += calc
MCTVBMIOC01_LIBS += autosave
MCTVBMIOC01_LIBS += IocStat

# MCTVBMIOC01_registerRecordDeviceDriver.cpp derives from MCTVBMIOC01.dbd
MCTVBMIOC01_SRCS += MCTVBMIOC01_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
MCTVBMIOC01_SRCS_DEFAULT += MCTVBMIOC01Main.cpp
MCTVBMIOC01_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#MCTVBMIOC01_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
MCTVBMIOC01_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

