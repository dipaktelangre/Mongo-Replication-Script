var h = getHostName();
rs.initiate();
rs.add(h +":40002");
rs.add(h +":40003", true);
db.test.emp.save({Name: "Test emp"});
db.getMongo().setSlaveOk();
db.test.emp.save({Name: "Test emp"});



