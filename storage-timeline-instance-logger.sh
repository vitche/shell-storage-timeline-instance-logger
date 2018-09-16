#!/usr/bin/env bash

case $1 in
install)
    wget https://raw.githubusercontent.com/vitche/shell-storage-timeline-instance-logger/master/storage-timeline-instance-logger.sh -O- > /usr/bin/storage-timeline-instance-logger.sh
    chmod +x /usr/bin/storage-timeline-instance-logger.sh
    exit 0
esac

case $4 in
cpu)
    CPU_USAGE=`top -bn2 | awk '/^top -/ { p=!p } { if (!p) print }' | grep "Cpu" | awk '{print $2 + $4}' | awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'`
    # echo "$CPU_USAGE"
    storage-timeline.sh $1 addNumber $2 $3 "$CPU_USAGE"
    ;;
*)
    echo "Unable to track from unknown sensor $4"
    ;;
esac
