# From the Outside (c03-docker06)
Create a new docker image named `hello-name` with the tag `v1` that will have the following pre requisites:
 - Final image is based from alpine. You can make use of multi-stage build using any image you want on other stages.
 - When the image runs, it should output the following text: Hello `name`, where the value of name is passed during the container execution. 

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
  - Dockerfile: used to build the image

- Dockerfile: used to create the image
- c03-docker06.txt: Containing the commands used to build and execute the image, as well as the output of container execution.

