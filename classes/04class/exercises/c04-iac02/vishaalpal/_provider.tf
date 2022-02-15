# Define the provider and authentication method
provider "aws" {
  region                   = "ap-southeast-2"
  shared_config_files      = ["/Users/vishaal.pal@contino.io/.aws/config"]
  shared_credentials_files = ["/Users/vishaal.pal@contino.io/.aws/credentials"]
}
