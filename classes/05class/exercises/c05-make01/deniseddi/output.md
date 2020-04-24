# Output of command "make build"

\$ make build
echo "This image was created by Denise based on the 4e24982" > index.html
docker build -t make01:4e24982 .
Sending build context to Docker daemon 4.096kB
Step 1/2 : FROM httpd:2.4.41-alpine
2.4.41-alpine: Pulling from library/httpd
aad63a933944: Pull complete
29ade582b51e: Pull complete
7e41ad5b6f9c: Pull complete
ebf61b47b4ca: Pull complete
9c060bce4eae: Pull complete
Digest: sha256:06ad90574c3a152ca91ba9417bb7a8f8b5757b44d232be12037d877e9f8f68ed
Status: Downloaded newer image for httpd:2.4.41-alpine
---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
---> 24e3de09c4de
Successfully built 24e3de09c4de
Successfully tagged make01:4e24982d

# Output of command "make push"

\$ make push
docker tag make01:4e24982 portoddi/make01:4e24982
docker push portoddi/make01:4e24982
The push refers to repository [docker.io/portoddi/make01]
4bdcd90120cd: Pushed
8e24b43b535f: Pushed
1dfb4a5d0ecd: Pushed
3313c0c04ade: Pushed
310889822143: Pushed
beee9f30bc1f: Pushed
4e24982: digest: sha256:564a70c9997d173727d55a72d5ed17c0a9675706224c59ea94c0998377a7ba7c size: 1569

#Output of command "make run"
\$ make run
docker run -p 80 -d portoddi/make01:4e24982
203202a88413f720660dc4034717660a5919386b980f5ae307bc88e061c6887b
