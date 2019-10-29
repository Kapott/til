# How to create a super fast ram disk

Very  useful for running things from ram (gameservers, other things which require fast I/O)

    mkdir -p /mnt/ram
    mount -t tmpfs tmpfs /mnt/ram -o size=8192M
