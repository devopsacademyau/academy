# C03-Docker02

## Docker

- [Dockerfile.v1](Dockerfile.v1)
- [Dockerfile.v2](Dockerfile.v2)

## Command Execution Output

- Curl command and its output of before changing the image:

  - Container: exercise02:v1
    ```
    curl localhost:8081
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
    ```
  - Container: exercise02:v2
    ```
    curl localhost:8082
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
    ```

- Curl command and its output of after changing the image:

  - Container: exercise02:v1

    ```
    curl localhost:8081
    <h1>DevOps Academy - Docker - Exercise c03-docker02</h1>
    ```

  - Container: exercise02:v2
    ```
    curl localhost:8082
    <h1>DevOps Academy - Hello World!</h1>
    ```

- Explain any difference between the responses of the webservers before and after changing the file locally:
  ```
  In the first container, the html content is copied during its creation, whereas the content for the second container is dynamically mounted during the the "docker run" command by the volume flag -v
  ```

---

Answer for exercise [c03-docker02](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker02/README.md)
