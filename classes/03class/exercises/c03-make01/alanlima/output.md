 alima  ALAN-LIMA  ~/projects/…/alanlima   alanlima/c03-make01  ?  3  22:49:29 
 $  make build
  🚀 Creating index.html
  💪 Building image make01:1c0aae8
docker build -t make01:1c0aae8 .
Sending build context to Docker daemon  10.24kB
Step 1/2 : FROM httpd:2.4.41-alpine
 ---> 54b0995a6305
Step 2/2 : COPY index.html /usr/local/apache2/htdocs/
 ---> Using cache
 ---> 9de8a6995b52
Successfully built 9de8a6995b52
Successfully tagged make01:1c0aae8
  ❌ Deleting index.html
  ✅ All done

 alima  ALAN-LIMA  ~/projects/…/alanlima   alanlima/c03-make01  ?  3  22:49:33 
 $  make push
 🚀🚀 Pushing image to the Space 🌌🌌 ... Ops to Docker Hub 🐳
docker push alanrlima/make01:1c0aae8
The push refers to repository [docker.io/alanrlima/make01]
59bcafa53817: Layer already exists 
8e24b43b535f: Layer already exists 
1dfb4a5d0ecd: Layer already exists 
3313c0c04ade: Layer already exists 
310889822143: Layer already exists 
beee9f30bc1f: Layer already exists 
1c0aae8: digest: sha256:d4afcaa3ab69754796f8e5bd4be5340bdeba9953d8fd5e81f387f6043e4a4e5a size: 1569
  ✅ All done

 alima  ALAN-LIMA  ~/projects/…/alanlima   alanlima/c03-make01  ?  3  22:49:56 
 $  PORT=9095 make run
 🏃‍♂️ Run boy run... Ops running the image on port 9095 🙄
docker run -dp 9095:80 make01:1c0aae8
80e97e53d39f4a9a3d7ad822d1f609fbca65b5043c470f451ef30d5df0282596
 ✅ The server is running under 🔥🔥🔥🔥🔥 
curl http://localhost:9095
This image was created by 'Alan Lima', based on the '1c0aae8'