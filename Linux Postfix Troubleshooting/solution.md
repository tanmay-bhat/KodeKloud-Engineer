1. Check the status of the service : `systemctl status postfix -l`

2. Check the logs of the service : `journalctl -xe`

3. Edit the file : `/etc/postfix/main.cf` : 

- Uncomment the below :
```
inet_interfaces = all
inet_interfaces = $myhostname
```

- Comment out the below : 
```
#inet_interfaces = $myhostname, localhost
#inet_interfaces = localhost
```
