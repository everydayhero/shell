docker run --rm -it \
	-v $HOME:/home/`whoami` \
	-v /var/run:/srv/host.var.run \
	-v /tmp:/srv/host.tmp \
	--privileged=true \
	quay.io/everydayhero/shell \
	`whoami` `id -u` `id -g` /bin/bash
