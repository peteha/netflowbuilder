echo "Server is: $1"
echo "Killing any remote iperf servers on $1"

ssh $1 'pkill iperf3'
sleep 2
echo "Starting server on $1 on port $2"
ssh $1 'iperf3 -sD -p '$2''


for (( ; ; ))
do
    rtime=$(shuf -i 3-20 -n 1)
    echo "TCP Runtime is: $rtime"
    iperf3 -c $1 -p $2 -i 1 -t $rtime
    rtime=$(shuf -i 3-20 -n 1)
    echo "UDP Runtime is: $rtime"
    iperf3 -u -c $1 -p $2 -i 1 -t $rtime
done