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
	- you may also need to include your ruby env for crontab, i.e.: `source /usr/local/rvm/environments/ruby-2.4.1` 

+ ensure execute perms on watchlog.sh and what_a_mess.rb, i.e.:
```bash
chmod +x {watchlog.sh,what_a_mess.rb}
```

+ ensure twilio-ruby gem installed (tested in ruby 2.4):
```bash
gem install twilio-ruby
```

+ create a cron to ensure the watchlog.sh is running via desired user's `crontab -e`, i.e.:
```bash
* * * * * pgrep -u root watchlog.sh || /opt/twiliostuffs/watchlog.sh
```
