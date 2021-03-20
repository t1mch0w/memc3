clients="node1 node2 node3 node4 node5 node6"

#for th in $(seq 1 16)
for th in $(seq 2)
do
echo $(date) "start the server with $th threads"
../memc3 -m 50240 -t $th -d
#./start_server.sh $th
sleep 10
echo $(date) "load the data"
./bench_client -t 1 -l kv100M_op100M_zipf.dat.load.bin -s 10.10.1.1

echo $(date) "start the clients with $th threads"
for client in $clients
do
sudo ssh $client "cd /mnt/memc3/bench;./bench_client -t 16 -d 120 -l $1.${client} -s 10.10.1.1" > log_thread${th}_${client} 2>&1 &
done

wait
#sudo pkill memc3

sleep 10
echo $(date) "finish the test with $th threads"
done
