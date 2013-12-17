#!/bin/bash
export PATH=/home/lightbox/warden/ruby193/bin:/home/lightbox/warden/warden/bin:/home/lightbox/warden/warden/bin/iptables/sbin:$PATH
do_start()
{
	cd /home/lightbox/warden/warden  
        nohup bundle exec rake warden:start[config/linux.yml] &>/dev/null &
        echo $! >/home/lightbox/warden/warden/status/warden.pid
}

do_stop()
{
        pid=$(cat /home/lightbox/warden/warden/status/warden.pid)
        kill -9 ${pid}
}

case C"$1" in
    Cstart)
        echo "Starting ... "
        do_start
        ;;
    Cstop)
        echo "Stopping ... "
        do_stop
        ;;
    *)
        echo "Usage: $0 {start|stop}" >&2
        exit 3
        ;;
esac
