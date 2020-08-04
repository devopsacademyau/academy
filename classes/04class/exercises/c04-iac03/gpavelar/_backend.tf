##
# I know the path can be relative, I used absolute
# just to save all devops file on the same dir.
#
terraform {
  backend "local" {
    path = "terraform-states/second-terraform-state.tfstate"
  }
}
