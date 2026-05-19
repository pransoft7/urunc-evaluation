mkdir -p /tmp/fio-test

# Sequential read
fio --name=seq-read --rw=read --bs=1m --size=512m \
    --numjobs=1 --iodepth=1 --runtime=10 --time_based \
    --filename=/tmp/fio-test/testfile --output-format=normal

# Sequential write
fio --name=seq-write --rw=write --bs=1m --size=512m \
    --numjobs=1 --iodepth=1 --runtime=10 --time_based \
    --filename=/tmp/fio-test/testfile --output-format=normal

# Random read
fio --name=rand-read --rw=randread --bs=4k --size=512m \
    --numjobs=1 --iodepth=32 --runtime=10 --time_based \
    --filename=/tmp/fio-test/testfile --output-format=normal

# Random write
fio --name=rand-write --rw=randwrite --bs=4k --size=512m \
    --numjobs=1 --iodepth=32 --runtime=10 --time_based \
    --filename=/tmp/fio-test/testfile --output-format=normal
