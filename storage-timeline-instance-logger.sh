#!/usr/bin/env bash
CPU_USAGE=`top -bn2 | awk '/^top -/ { p=!p } { if (!p) print }' | grep "Cpu" | awk '{print $2 + $4}' | awk '{ sum += $1; n++ } END { if (n > 0) print sum / n; }'`
# echo "$CPU_USAGE"
storage-timeline.sh $1 addNumber $2 $3 "$CPU_USAGE"
