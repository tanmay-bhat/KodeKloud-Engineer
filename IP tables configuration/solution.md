## Solution :

1. Install iptables in all app servers :

	  `yum install iptables-services -y`


2. Start iptables service and enable it on boot:

	  `systemctl start iptables && systemctl enable iptables`


3. Check iptables status:

	  `systemctl status iptables`


4. Add the rule to accept incoming traffic on port 6400 from LBR IP:

   `iptables -R INPUT 5 -p tcp --destination-port 6400 -s 172.16.238.14 -j ACCEPT`


5. Add the rule to block incoming traffic on port 6400 from all hosts :

  	  `iptables -A INPUT -p tcp --destination-port 6400 -j DROP`

  6. Save the rules:

  	    `service iptables save`

7. Follow the same steps for all app servers.

8. Go to LBR host and check if the traffic is able to reach the app servers:

	`curl 172.16.238.10:6400`
	`curl 172.16.238.11:6400`
	`curl 172.16.238.12:6400`

  
9. To very the rules, go to another host like DB server and run the same curl request to app servers to verify that the request is blocked.