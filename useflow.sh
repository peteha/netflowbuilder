echo "Server is: $1"
for (( ; ; ))
do
    rtime=$(shuf -i 3-20 -n 1)
    echo "TCP Runtime is: $rtime"
    iperf3 -c $1 -p $2 -t $rtime
    rtime=$(shuf -i 3-20 -n 1)
    echo "UDP Runtime is: $rtime"
    iperf3 -u -c $1 -p $2 -t $rtime -b 5M
done