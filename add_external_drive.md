# How to Mount an exFAT External SSD on Raspberry Pi

## Prerequisites

1. A Raspberry Pi running a compatible operating system (e.g., Raspberry Pi OS).
2. An external SSD formatted as exFAT.
3. SSH access to the Raspberry Pi or direct access to the terminal.

## Step 1: Install exFAT support

1. Update the package list:

```

sudo apt update

```

2. Install the necessary exFAT packages:

```

sudo apt install exfat-fuse exfat-utils

```

## Step 2: Mount the external SSD

1. Connect the external SSD to the Raspberry Pi.

2. List all available disk devices:

```

sudo fdisk -l

```

bash Locate your external SSD by identifying its device name (e.g., `/dev/sda1`,
`/dev/sdb1`, etc.) based on the storage size and type.

3. Create a directory where you want to mount the external SSD:

```

sudo mkdir /mnt/external-ssd

```

css 4. Mount the external SSD to the directory you created:

```

sudo mount -t exfat /dev/sda1 /mnt/external-ssd

```

javascript Replace `/dev/sda1` with the device name you found in step 2, and
`/mnt/external-ssd` with your desired mount point directory.

5. Add an entry to the `/etc/fstab` file to make the mounting persistent across
   reboots:

1. Create a backup of the original file:

```

sudo cp /etc/fstab /etc/fstab.backup

```

2. Open the `/etc/fstab` file with a text editor like `nano`:

```

sudo nano /etc/fstab

```

3. Add the following line at the end of the file:

```

/dev/sda1 /mnt/external-ssd exfat defaults,auto,umask=000,rw,nofail 0 0

```

Replace `/dev/sda1` with the device name you found in step 2, and
`/mnt/external-ssd` with your desired mount point directory.

4. Save the file and exit the text editor. For `nano`, press `Ctrl + X`, then
   `Y`, and finally, press `Enter` to save and exit.

5. Reboot your Raspberry Pi:

```

sudo reboot

```

## Step 3: Verify the external SSD is mounted

1. Check if the external SSD is mounted by running:

```

df -h

```

bash Look for the mount point you specified (e.g., `/mnt/external-ssd`) in the
output.
