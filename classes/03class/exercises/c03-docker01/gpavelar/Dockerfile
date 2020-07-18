FROM alpine:latest
COPY --from=hashicorp/terraform:0.12.20 /bin/terraform /bin/
RUN apk update
CMD ["terraform", "-v"]