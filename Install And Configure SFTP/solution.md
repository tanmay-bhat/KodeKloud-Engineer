1. Create the user and configure password for it:

```
sudo adduser --shell /bin/false james
sudo passwd james
```
2. Create the fodler required by SFTP user: 
```
sudo mkdir -p /var/www/opt
```
3. Edit the ssh config(`sudo vi /etc/ssh/sshd_config`) and addd the below configs at the end of the file : 
```
Match user james
    PasswordAuthentication yes
    ChrootDirectory /var/www/opt
    ForceCommand internal-sftp
    AllowTcpForwarding no
    X11Forwarding no
```    
4. Restart the ssh deaemon: 
```
sudo systemctl restart sshd
```
5. Verify that the login works, run the below login from jumphost:
```
sftp james@stapp03
```