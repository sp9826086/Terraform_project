
resource "github_repository" "terraform-first-repo" {
    name        = "first-repo-from-terraform"
    description = "My first created terraform"
    visibility = "public"
    auto_init = true
}

resource "github_repository" "terraform-second-repo" {
    name        = "second-repo-from-terraform"
    description = "My second created terraform"
    visibility = "public"
    auto_init = true
}