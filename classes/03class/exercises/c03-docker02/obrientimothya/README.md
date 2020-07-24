# C03-Docker02

## Docker 
- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output
- Curl command and its output of before changing the image:
```
V1 Before
curl localhost:8081

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

V2 Before
curl localhost:8082

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
```

- Curl command and its output of after changing the image:
```
V1 After
curl localhost8081

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>

V2 After
curl localhost:8082

<h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
<p>My amazing change.</p>
```

- Explain any difference between the responses of the webservers before and after changing the file locally:
```
In v1 the file is copied and bundled into the container image at build time. When container v1 runs, it uses the file locally within the container and has no reference back to the file on the host filesystem.
In v2 the path is mounted as a volume referece. Therefore, changes to the local file will be live within the container.
```

***
Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
