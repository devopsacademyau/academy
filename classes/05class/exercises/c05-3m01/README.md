# Mixing Make and Docker (c05-3m01)

In this exercise you will use the answer from exercise `c05-make01`. If you did not do it yet, [please do it first then come back](../c05-make01/README.md).

You need to implement 3 Musketeers applying concepts seen in these [4 patterns](../../3musketeers/README.md#Patterns_In_3M) presented in class.

For the Make targets in exercise `c05-make01` (build, push, run):
1. Create separate files for `build` and `push` Make targets. 
   1. scripts/build.sh
   2. scripts/push.sh
   3. scripts/run.sh
2. Create a `docker-compose.yaml` file and define a service called `web` that will build from the Dockerfile    

## Submit a PR with the following files:

- **README.md**: based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
  - Dockerfile (same file from exercise `c05-make01`)
      - with the instructions to build your docker image
  - docker-compose.yaml
      - with a service called `web`
  - Makefile
      - with the three targets mentioned above, updated with the 4 patterns from 3 Musketeers seen in class. 
  - output.md
      - with the execution and outputs of the following command: `make build`, `make push`, `make run`
