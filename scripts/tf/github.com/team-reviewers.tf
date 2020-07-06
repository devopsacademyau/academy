module "team-reviewers" {
  source              = "./da-teams"
  group_name          = "reviewers"
  group_role          = "member"
  members             = [
    "deniseddi",
    "starkmatt",
    "christina-roperto",
    "roperto",
    "luizfds",
    "lgothelipe"
  ]
}
