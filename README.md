# snapraid_container

lets containerize the snapraid cli and daemon

## compose example

```yaml
services:
  snapraid:
    build: .
    container_name: snapraid
    cap_add:
      - SYS_RAWIO # is necessary to allow smartctl permission to query your device SMART data.
      # - SYS_ADMIN # If you have NVMe drives, you must add --cap-add SYS_ADMIN as well.
    volumes:
      - /run/udev:/run/udev:ro # necessary to provide snapraid with access to your device metadata.
      - /mnt/snapraid/disk0:/mnt/snapraid/disk0
      - /mnt/snapraid/disk1:/mnt/snapraid/disk1
      - /mnt/snapraid/disk2:/mnt/snapraid/disk2
      - /mnt/snapraid/disk3:/mnt/snapraid/disk3
      - /mnt/snapraid/disk4:/mnt/snapraid/disk4
      - /mnt/snapraid/disk5:/mnt/snapraid/disk5
      - /mnt/snapraid/parity:/mnt/snapraid/parity
      - /mnt/snapraid/parity2:/mnt/snapraid/parity2
      - ./snapraid.conf:/etc/snapraid.conf
      - ./snapraidd.conf:/usr/local/etc/snapraidd.conf
    devices:
      - /dev/sda:/dev/sda
      - /dev/sdb:/dev/sdb
      - /dev/sdc:/dev/sdc
      - /dev/sdd:/dev/sdd
      - /dev/sde:/dev/sde
      - /dev/sdf:/dev/sdf
      - /dev/sdg:/dev/sdg
      - /dev/sdh:/dev/sdh
    ports:
      - 7627:7627
    restart: unless-stopped
```
