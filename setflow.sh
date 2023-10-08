echo "Server is: $1"

echo "Killing any remote iperf servers on $1"
ssh $1 <<'EOF'
kill -9 $(ps -aux | grep iperf | awk '{print $2}')
EOF