# BananaPITempPower
Read Temperature and Power-Stats from Banana PI with Bananian.
You can use with Telegraf from Influxdata

## requirement
OS: Bananian

```
apt install sudo
```

Follow Entry in /etc/sudoers or /etc/sudoers.d/<File> :

```
Cmnd_Alias  SOCTEMP=/usr/sbin/soctemp
telegraf  ALL=NOPASSWD: SOCTEMP
```

## Install 

copy stats.sh to /usr/local/bin/

```
cp stats.sh /usr/local/bin
chmod +x /usr/local/bin/stats.sh
```
The script configure in /etc/telegraf/telegraf.conf or in single file (exp.: /etc/telegraf/telegraf.d/exec.conf)

*Example:*
```
[[inputs.exec]]
  ## Commands array
  commands = [
    "/usr/local/bin/stats.sh"
  ]

  ## Timeout for each command to complete.
  timeout = "5s"

  ## measurement name suffix (for separating different commands)
  name_suffix = "_bpi"

  ## Data format to consume.
  ## Each data format has it's own unique set of configuration options, read
  ## more about them here:
  ## https://github.com/influxdata/telegraf/blob/master/docs/DATA_FORMATS_INPUT.md
  data_format = "influx"
```
Restart Telegraf


Example Picture from my Grafana : https://github.com/kenael/BananaPITempPower/wiki/Example-Picture-from-Grafana-Dashboard
