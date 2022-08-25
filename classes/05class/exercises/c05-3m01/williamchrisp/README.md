# C05-3M01

## Make
- [Dockerfile](Dockerfile)
- [docker-compose](docker-compose.yaml)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)

## Command Execution Output

% make create_bucket
docker-compose run --rm 3m make _create_bucket
Creating williamchrisp_3m_run ... done
bash scripts/create_bucket.sh
make_bucket: williamdevopsacademy


% make delete_bucket
docker-compose run --rm 3m make _delete_bucket
Creating williamchrisp_3m_run ... done
bash scripts/delete_bucket.sh
remove_bucket: williamdevopsacademy

***
Answer for exercise [c05-3m01](<WIP>)