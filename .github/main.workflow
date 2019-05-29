workflow "Development Release" {
  resolves = ["make-release"]
  on = "push"
}

action "is-release-branch" {
  uses = "actions/bin/filter@master"
  args = "branch dev-release"
}

action "make-release" {
  uses = "frankjuniorr/github-create-release-action@master"
  needs = ["is-release-branch"]
  env = {
    VERSION = "Test"
    DESCRIPTION = "Test"
  }
}
