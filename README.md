# Mongo-Replication-Script
This is bat script which helps to create Mongo Services and set the replication on local machine. 

## Purpose 
The purpose for this script is to create the 3 MongoDB services by setting different engine (inMemory, wiredTiger, Mmapv1)
and enabling replication for the same  

## Prerequisite 
- Installed MongoDB Enterprise V3.4 (Enterprise for InMemory engine)
- MongoDB installed in default path (If not, change the path in script)

## Setup
1. Open CMD as administrator (Important)
2. Navigate to current folder (cd dir)
3. Run Setup.bat from command line 

	`> setup.bat` 

## Services Configuration 
| Service 			|Port		 |Engine			|Type			| Data Folder |
|---------------|:-------:|-----------|--------|-------------|
| MongoInMemory	|	40001		|inMemory		|Primary		|	c:\mongodata\inMemory\db |
| MongoWiredTiger	|	40002	|	wiredTiger	|	Secondary	|	c:\mongodata\wiredTiger\db |
| MongoMmapv1		|	40003		|mmapv1			|Arbiter			| c:\mongodata\mmapv1\db |

## Error resolution 
1. If you get ```notMasterNoSlaveOk``` on secondary instance for reading collection 
	Connect to secondary instance and enable slave 
  
   ```>db.getMongo().setSlaveOk()```

## What script does 
1. Create data folders for mongodb
2. Copy configuration files 
3. Create 3 services of MongoDB
3. Start all the services 
4. Enable replication 
5. Add 40002, 40003 into replication set 
6. Add mongo to PATH 
7. Create test `emp` collection and add first records to test replication 

## Safe Clean all the work 
1. `run zremovemongo.bat`

> It does all the reverse thing to clean !!!


