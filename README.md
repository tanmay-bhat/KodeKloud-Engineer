# KodeKloud Engineer Solutions
This repository will contain DevOps, Sysadmin challenges & their solutions hosted by KodeKloud Engineer.

## Website : [KodeKloud Engineer](https://kodekloud-engineer.com/)

## Project details : [Link](https://kodekloudhub.github.io/kodekloud-engineer/docs/projects/nautilus)

## Deployment architecture : [Link](https://www.lucidchart.com/documents/edit/58e22de2-c446-4b49-ae0f-db79a3318e97/0_0?shared=true)

## SSH Automation : Use the ssh-config.sh script to login to all servers with Passwordless SSH.
- You can run the script in jumhost via below command :
```
bash <(curl -sL https://gist.githubusercontent.com/tanmay-bhat/efbf13c604178ca916128195ffc860a0/raw/20f8300aa00054f27107e32420ab05cb2cd296e0/ssh-config.sh)
```

- The script does below actions : 
  - Install sshpass
  - Generate RSA Keys
  - Copy the generated public key to all servers via ssh-copy-id
  - Add the above servers as hosts in `./ssh/config` file
- Once the script is executed, you can login to servers via ssh like : `ssh app1` or `ssh jenkins` etc.
