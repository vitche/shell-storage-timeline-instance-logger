#!/usr/bin/env bash

case $1 in
install)
    wget https://raw.githubusercontent.com/vitche/shell-storage-timeline-instance-logger/master/storage-timeline-instance-logger.sh -O- > /usr/bin/storage-timeline-instance-logger.sh
    chmod +x /usr/bin/storage-timeline-instance-logger.sh
    exit 0
    ;;
install-cron)
    OLD_CRONTAB="$(crontab -l)"
    schema=$3
    if [[ -z "$schema" ]]; then
      schema="instance-logs"
    fi
    timeLine=$4
    if [[ -z "$timeLine" ]]; then
      timeLine="$(od -x /dev/urandom | head -1 | awk '{OFS=""; print $2$3,$4,$5,$6,$7$8$9}')"
    fi
    CRON_DEFINITION="*/5 * * * * storage-timeline-instance-logger.sh \"$2\" \"$schema\" \"$timeLine\" cpu"
    NEW_LINE=$'\n'
    if [[ $OLD_CRONTAB = *"storage-timeline-instance-logger.sh"* ]]; then
      echo "storage-timeline-instance-logger.sh CRON task already installed"
    else
      echo "$OLD_CRONTAB$NEW_LINE$CRON_DEFINITION" | crontab -
      echo "storage-timeline-instance-logger.sh CRON task installed"
    fi
    exit 0
    ;;
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
