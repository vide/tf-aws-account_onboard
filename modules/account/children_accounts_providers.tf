provider "aws" {
  alias  = "FooBar"
  region = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::116981764930:role/RootAccountAccessRole"
  }
}

provider "aws" {
  alias  = "FooBar3"
  region = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::881490092279:role/RootAccountAccessRole"
  }
}
