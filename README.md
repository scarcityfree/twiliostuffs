# twiliostuffs
###### work in progress
### basic usage
+ create a file called `./creds` and populate it, i.e.:
```bash
export twilio_account_sid='yourSuperSecretSID'
export twilio_auth_token='yourSuperSecretAuthToken'
export twilio_number='1231231234'
export alert_number='1231231235'
export log_location='/minecraft/logs/latest.log'
export what_a_ruby_mess='/opt/twiliostuffs/what_a_mess.rb'
```

+ create a cron to ensure the watchlog.sh is running via desired user's `crontab -e`, i.e.:
```bash
* * * * * pgrep -u root watchlog.sh || /opt/twiliostuffs/watchlog.sh
```
