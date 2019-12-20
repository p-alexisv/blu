# blu
Bosh Logs Uncompressor

A simple bash script that will uncompress the compressed file that is the product of `bosh logs` command

The script expects the compressed file to be the output file of the following command:
```
bosh -d service-instance_uuid logs
```

How to use:

1) Download the bash script.
```
wget https://raw.githubusercontent.com/p-alexisv/blu/master/blu.sh
```

2) Run the script on the compressed bosh log file.
```
$ bash blu.sh service-instance_uuid.tgz
```

e.g.,

```
ubuntu@opsmanager-2-7:/tmp/x$ ls -l
total 27384
-rw------- 1 ubuntu ubuntu 28038291 Dec 20 17:35 service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz
ubuntu@opsmanager-2-7:/tmp/x$ wget https://raw.githubusercontent.com/p-alexisv/blu/master/blu.sh
--2019-12-20 17:37:57--  https://raw.githubusercontent.com/p-alexisv/blu/master/blu.sh
Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 151.101.40.133
Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|151.101.40.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2461 (2.4K) [text/plain]
Saving to: ‘blu.sh’

blu.sh                      100%[==========================================>]   2.40K  --.-KB/s    in 0s

2019-12-20 17:37:57 (53.7 MB/s) - ‘blu.sh’ saved [2461/2461]

ubuntu@opsmanager-2-7:/tmp/x$ bash blu.sh service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz

The main bosh log file that we will uncompress is:
service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz
Are you definitely sure you want to uncompress the file in this directory (y/n)? y

Ok, we'll continue then!

Uncompressing the main bosh log file: service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz now...
====================================================================
     Extracting deployment name from service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz...
     Extracted: service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212
     Creating directory service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212...
     Directory created.
     Uncompressing service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz to service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212...
     Uncompress done.
     Deleting service-instance_c233be5b-5e87-4b28-af73-226a965a9823-20191220-173524-376330212.tgz...
     Deleted.

The TGZ files are:
master.98b75254-5676-420e-a064-5c757adb3596.2019-12-20-17-35-21.tgz
worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662.2019-12-20-17-35-15.tgz
worker.9fc610d2-d858-4de5-9660-853ad8b90557.2019-12-20-17-35-15.tgz

Uncompressing the TGZ files now...
====================================================================
     Extracting instance name from master.98b75254-5676-420e-a064-5c757adb3596.2019-12-20-17-35-21.tgz...
     Extracted: master.98b75254-5676-420e-a064-5c757adb3596
     Creating directory master.98b75254-5676-420e-a064-5c757adb3596...
     Directory created.
     Uncompressing master.98b75254-5676-420e-a064-5c757adb3596.2019-12-20-17-35-21.tgz to master.98b75254-5676-420e-a064-5c757adb3596...
     Uncompress done.
     Deleting master.98b75254-5676-420e-a064-5c757adb3596.2019-12-20-17-35-21.tgz...
     Deleted.

     Extracting instance name from worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662.2019-12-20-17-35-15.tgz...
     Extracted: worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662
     Creating directory worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662...
     Directory created.
     Uncompressing worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662.2019-12-20-17-35-15.tgz to worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662...
     Uncompress done.
     Deleting worker.29ab3f8b-82fa-4ae7-9c69-cac77685b662.2019-12-20-17-35-15.tgz...
     Deleted.

     Extracting instance name from worker.9fc610d2-d858-4de5-9660-853ad8b90557.2019-12-20-17-35-15.tgz...
     Extracted: worker.9fc610d2-d858-4de5-9660-853ad8b90557
     Creating directory worker.9fc610d2-d858-4de5-9660-853ad8b90557...
     Directory created.
     Uncompressing worker.9fc610d2-d858-4de5-9660-853ad8b90557.2019-12-20-17-35-15.tgz to worker.9fc610d2-d858-4de5-9660-853ad8b90557...
     Uncompress done.
     Deleting worker.9fc610d2-d858-4de5-9660-853ad8b90557.2019-12-20-17-35-15.tgz...
     Deleted.


Done uncompressing all files.
ubuntu@opsmanager-2-7:/tmp/x$
```
