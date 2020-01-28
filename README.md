You want give some files to your friends, but you dont want use from usb. 
it's a image based on nginx 1.17.7 image for share files which you want give to your friends.

```
How to run:
docker run -d --name share-files-server -p 8081:8081 --volume <your directory path>:/files share-my-files:0.1
```

```
Username and Password:
default username and password are user1.
you can change username and password as you want.
echo -n "user2:" >  htpasswd
echo "user2" | xargs openssl passwd -apr1 >> htpasswd
docker cp htpasswd share-files-server:/etc/nginx/.htpasswd
