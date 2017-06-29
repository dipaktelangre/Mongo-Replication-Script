@ECHO OFF

ECHO Stopping all services 
net stop MongoInMemory
net stop MongoWiredTiger
net stop MongoMmapv1

ECHO Deleting all the services
sc delete MongoInMemory
sc delete MongoWiredTiger
sc delete MongoMmapv1

ECHO deleting data folders

RD /S /Q c:\mongodata

ECHO Deleting config files 

del "C:\Program Files\MongoDB\Server\3.4\inMemory.cfg"
del "C:\Program Files\MongoDB\Server\3.4\wiredTiger.cfg"
del "C:\Program Files\MongoDB\Server\3.4\mmapv1.cfg"

ECHO Everything cleaned ..........

@ECHO ON