1 - Go to the setup page : https://postfixadmin.domain.tld/setup.php

:bulb: Don't forget to add a new A/CNAME record in your DNS zone.

2 - Define the setup password

3 - Set the setup hash 

```
docker exec -ti postfixadmin setup

> Postfixadmin setup hash : ffdeb741c58db70d060ddb170af4623a:54e0ac9a55d69c5e53d214c7ad7f1e3df40a3caa
Setup done.
```

4 - Create your admin account

5 - Go to the login page : https://postfixadmin.your-domain.tld/

6 - You can now create your domains, mailboxes, alias...etc :smiley: 

![](http://i.imgur.com/4B7UMKi.png)

![](http://i.imgur.com/Jhoy5On.png)