# Mongodb

Notes aimed at 3.4+

## Gotcha's

- Read the damn [security checklist](https://docs.mongodb.com/v3.4/administration/security-checklist/)!

- Standalone server is fine for dev. For production you need at least _three_ servers to get failover working. (At the very least 2 + an arbiter)

- Default installation doesn't require authr/authz. Boot server with `--auth` flag to enable authr/authz, reiterates #1

- Replicasets
  
  - Priority 0 members cannot become primary and cannot trigger elections. These are 'backups'.
  
  - To prevent a 'standoff' with an uneven amount of nodes, use arbiter nodes
  
  - Replicasets: You can 'derank' a current primary: `rs.stepDown()`
  
  - You can change a configuration with the following steps:
    
    - `var c = rs.conf();`
    
    - `c.members[0].blabla` - Any state mutation of the config you want
    
    - `rs.reconfig(c)`

## Create superuser

User which also has system-wide superuser access.

```javascript
db.createUser({ 
    user: "admin",
    pwd: "foobar",
    roles:[ 
        {role: "root", db:"admin"}
    ]
});
```

## Create database admin

Suited for CRUD in collections, so use within applications.

```javascript
db.createUser({
    user: "name",
    pwd: "password",
    roles: [
        {role: "readWrite", db: "applicationDatabase1"}
    ]
});
```

## Replicaset from scratch

- Start all mongod instances with `--replset "myset"`

- Run `rs.initiate()` on *just one and only one* mongod instance for the replica set.

- On the _one_ server, edit and run this:

```javascript
rs.initiate( {
    _id : "myset",
    members: [
        { _id: 0, host: "10.0.10.15:27017" },
        { _id: 1, host: "192.168.0.50:27017" },
        { _id: 2, host: "fakedb.mydomain.com:27017" }
    ]
});
```

- Run `rs.conf()` in the shell to show the current configuration

## Replicaset from standalone

- Stop `mongod` instance

- Restart `mongod` instance with `--replset "myname"`

- Connect to `mongos` shell

- Run `rs.initate()` on the master server

- Run `rs.add()` with 0 prio for each new slave member on the server

```javascript
rs.add({
    host: "mongodbd4.example.net:27017",
    priority: 0
})
```

- Once member has transitioned into `SECONDARY` state (Check with `rs.status()`) use:
  
      var cfg = rs.conf();
      cfg.members[{new member index}].priority = 1;
      cfg.members[{new member index}].votes = 1;
      rs.reconfig(cfg)

where n is the array index of the new member in the members array.

## Docker, mongo and EBS

1. Move docker image/container directory to EBS volume mount

2. Make *sure* you set logging options to prevent 1G/day growth

3. Volume-mount the data directory on the EBS

Example `/etc/docker/daemon.json`, limiting logging to 300mb and moving the docker data dir over to `/data/docker`. Provided here is that `/data` is an EBS volume mount:

```json
{
    "data-root": "/data/docker",
    "log-driver":"json-file",
    "log-opts": {"max-size": "100m", "max-file": "3"}
}
```

## Localhost replicaset bash script

```bash
#!/usr/bin/env bash

mkdir -p data/{db1,db2,db3}

#Create docker network
docker network create mongonet

# Here we start our main MongoDB instances in 3.6.3
docker run -d -p 27017:27017 -v $(pwd)/data/db1:/data/db1 \
    -u 1000:1000 -h mongo1 --network mongonet \
    --network-alias mongo1 --name mongo1 \
    mongo:3.6.3 --dbpath /data/db1 --replSet replicaTest --bind_ip_all --logpath /data/db1/mongod.log

docker run -d -p 27018:27017 -v $(pwd)/data/db2:/data/db2 \
    -u 1000:1000 -h mongo2 --network mongonet \
    --network-alias mongo2 --name mongo2 \
    mongo:3.6.3 --dbpath /data/db2 --replSet replicaTest --bind_ip_all --logpath /data/db2/mongod.log

docker run -d -p 27019:27017 -v $(pwd)/data/db3:/data/db3 \
    -u 1000:1000 -h mongo3 --network mongonet \
    --network-alias mongo3 --name mongo3 \
    mongo:3.6.3 --dbpath /data/db3 --replSet replicaTest --bind_ip_all --logpath /data/db3/mongod.log

sleep 2

# Here we initialize the replica
echo 'rs.initiate({
      _id: "replicaTest",
      members: [
         { _id: 0, host: "mongo1:27017" },
         { _id: 1, host: "mongo2:27017" },
         { _id: 2, host: "mongo3:27017", arbiterOnly:true }]});' | mongo
```
