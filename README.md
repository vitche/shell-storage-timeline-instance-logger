# shell-storage-timeline-instance-logger
*NIX scheduler for saving logs to the Storage.Timeline server

# Installation
```
wget https://raw.githubusercontent.com/vitche/shell-storage-timeline-instance-logger/master/storage-timeline-instance-logger.sh -O- | sh -s install
```

# CLI usage
```
# Add current CPU usage to the time-line
storage-timeline-instance-logger.sh {serverUri} {schema} {timeLine} cpu
