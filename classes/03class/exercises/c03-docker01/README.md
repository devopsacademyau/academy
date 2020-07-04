# Dockerfile (c03-docker01)

Create a new docker image named `da-terraform` with the tag `c03-docker-e01` that will have the following pre requisites:
 - Final image is based from alpine. You can make use of multi-stage build using any image you want on other stages.
 - Terraform cli installed `version 0.12.20`
 - Make sure that the final image is smaller than 80Mb
 - When the image runs, it should output the version of the terraform cli tool: 
 ```bash
 $ docker run -it da-terraform:c03-docker-e01
 Terraform v0.12.20
 $
 ```

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
  - Dockerfile: used to build the image

## References
- [https://linoxide.com/linux-how-to/how-to-install-terraform-on-centos-ubuntu/](https://linoxide.com/linux-how-to/how-to-install-terraform-on-centos-ubuntu)
