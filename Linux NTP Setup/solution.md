1. Install the ntp package and enable it post installing: 
```
sudo yum install ntp -y && sudo systemctl enable ntpd:
```
2. Edit the ntp conf file and comment out the default servers and add the below mentioned server:

```
sudo vi /etc/ntp.conf

server 1.south-america.pool.ntp.org iburst
```
3. Start the service and run the ntpstat command to check the status:
```
systemctl start  ntpd
```
```
ntpstat
```