### Solution :

A. Install tomcat via yum :

```bash
yum install tomcat -y

sudo systemctl start tomcat

sudo systemctl status tomcat
```

B. Configure Tomcat to run on 3004 port instead of default 8080 : 

- Edit the file `/usr/share/tomcat/conf/server.xml`.
- Look for **Connector port** and change the value to `3004`

1. Copy the ROOT.war file and deploy : 
- Copy the ROOT.war file from /tmp of Jump host via scp :

```bash
scp /tmp/ROOT.war steve@172.16.238.11:/home/steve
```
- Move the file to `/usr/share/tomcat/webapps`
- Restart the tomcat server by :  `systemctl restart tomcat`
- `curl localhost:3004` to see the webpage !
