# Basic Makefile (c03-make01)

In this exercise, you'll create a Makefile to execute docker commands to build, publish and run a docker image.

You'll need to create a new docker image, similar to the one in the [c03-docker02 exercise](/classes/03class/exercises/c03-docker02/README.md), with a few differences. The content of `index.html` must be dynamically created with the `short commit sha` value. The index.html should include this:
**This image was created by `your name`, based on the `short commit sha`**

The short commit sha value can be get by running the following command in your repository folder: `git rev-parse --short HEAD`

Additionally the docker image tag, instead of `v1` or `v2`, should also have the short commit sha as the tag.

Your Makefile should have the following steps:
1. **build** - This will build the image and tag it with the right value
    - The name of the image must be `make01`
2. **push** - This will push the image to your DockerHub account 
3. **run** - This will run the docker image locally.
    - The port to be mapped for the container should be dynamically provided during the `make run` command.
 

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
    - Dockerfile
        - with the instructions to build your docker image
    - Makefile
        - with the three phony targets mentioned above
