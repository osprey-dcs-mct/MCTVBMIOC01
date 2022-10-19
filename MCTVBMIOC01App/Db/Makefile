TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
DB += $(AUTOSAVE)/asApp/Db/save_restoreStatus.db
DB_INSTALLS += $(IOCSTATUS)/db/IocStatus.template
#DB_INSTALLS += 3jack_mirror.db
DB += 3jack_mirror.db
DB += 3jack_mirror_cs_motor.db

#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

