#!../../bin/linux-x86_64/MCTVBMIOC01

## You may have to change MCTVBMIOC01 to something else
## everywhere it appears in this file

< envPaths

#epicsEnvSet("ENGINEER", "Engineer")
#epicsEnvSet("LOCATION", "Location")

epicsEnvSet("IOCNAME", "MCTVBMIOC01")
epicsEnvSet("IOCNAME_PS1", "MCTVBMIOC01>")

epicsEnvSet("AS_PATH", "/asp/autosave/$(IOCNAME)")
epicsEnvSet("IOC_PREFIX","$(IOCNAME)")

#Upstream Outboard Motor
epicsEnvSet("M1", "MCTVBM01MOT01")

#Upstream Inboard Motor
epicsEnvSet("M2", "MCTVBM01MOT02")

#Downstream Motor
epicsEnvSet("M3", "MCTVBM01MOT03")

cd ${TOP}

## Register all support components
dbLoadDatabase("dbd/MCTVBMIOC01.dbd",0,0)
MCTVBMIOC01_registerRecordDeviceDriver(pdbbase) 

## Autosave set-up
#
#< ${AUTOSAVESETUP}/crapi/save_restore.cmd

## Load record instances
dbLoadRecords("db/3jack_mirror.db","P=MCTVBM01:,Q=CS_Y:,M1=$(M1),M2=$(M2),M3=$(M3),LENGTH=1070,WIDTH=210")
dbLoadRecords("db/3jack_mirror_cs_motor.db","P=MCTVBM01:,Q=CS_Y:,M1=$(M1),M2=$(M2),M3=$(M3)")
#dbLoadRecords("db/iocAdminSoft.db", "IOC=$(IOC_PREFIX)")
dbLoadRecords("db/IocStatus.template" , "IOC=$(IOC_PREFIX)")
dbLoadRecords("db/save_restoreStatus.db", "P=$(IOC_PREFIX):")

# Load the autosave configuration
cd iocBoot/${IOC}
< autosave.cmd

iocInit()

# Set up autosave
cd ${AS_PATH}
makeAutosaveFiles()
create_monitor_set("info_positions.req", 5, "")
create_monitor_set("info_settings.req", 15, "")

cd ${TOP}

#enable transform records
dbpf MCTVBM01:CS_Y:t1_enable 1
dbpf MCTVBM01:CS_Y:t2_enable 1

# sync the transform setpoints to the current positions
epicsThreadSleep(1.0)
dbpf MCTVBM01:CS_Y:sync.PROC 1
