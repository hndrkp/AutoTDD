workflow "Development Release" {
  resolves = ["make-release"]
  on = "push"
}

action "is-release-branch" {
  uses = "actions/bin/filter@master"
  args = "branch dev-release"
}

action "make-release" {
  uses = "hpi-swa-teaching/AutoTDD@release-action"
  needs = ["is-release-branch"]
  env = {
    TITLE = "Test"
    TAG = "Test"
    DESCRIPTION = "Test"
    TARGET = "dev"
    FILE=""
    CONTENT_TYPE="text/plain"
  }
  secrets = ["GITHUB_TOKEN"]
}
