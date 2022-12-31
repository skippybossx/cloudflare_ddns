# cloudflare_ddns
Bash script to autoupgrade dns to external ip in cloudflare

Edit config and fill with your login, API token etc.

Add script to run every 5 minutes or so to crontab using `crontab -e` and adding line
> */5 * * * * /bin/bash ~/ddns.sh >/dev/null 2>&1
<br>

![alt pic1](https://forum.aapanel.com/assets/files/2021-02-26/1614321795-190183-tmp.png)
![alt pic2](https://forum.aapanel.com/assets/files/2021-02-26/1614321840-241933-tmp1.png)
![alt pic3](https://forum.aapanel.com/assets/files/2021-02-26/1614321849-690607-tmp2.png)
