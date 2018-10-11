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
```

```
# Install the CRON task to automatically report CPU usage
storage-timeline-instance-logger.sh install-cron {serverUri} {schema} {timeLine}
```

# CYGWIN CRON installation
CYGWIN CRON configuration is actively discussed at:
https://stackoverflow.com/questions/707184/how-do-you-run-a-crontab-in-cygwin-on-windows

The installation command which is working fine is:
```
cygrunsrv --install cron --path /usr/sbin/cron --args -n
```

It is also necessary to run the following configuration tool:
```
cron-config
```
