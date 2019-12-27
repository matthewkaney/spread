#! /bin/sh 
### BEGIN INIT INFO
# Provides: codeserver
# Required-Start: $remote_fs
# Required-Stop: $remote_fs
# Default-Start: 3
# Default-Stop:
# Short-Description: codeserver
### END INIT INFO

# . /etc/rc.d/init.d/functions  # uncomment/modify for your killproc 

case "$1" in 
start) 
echo "Starting code-server." 
sudo -u `ls /home` /usr/local/bin/code-server --auth none --port 12000
;; 
stop) 
echo -n "Shutting down code-server." 
killproc -TERM /usr/local/bin/code-server 
;; 
*) 
echo "Usage: $0 {start|stop}" 
exit 1 
esac 
exit 0 
