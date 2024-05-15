terraform {
  backend "s3" {
    bucket         = "terraform-state-danit-devops-2"
    key            = "states/drych.tfstate"
    region         = "eu-central-1"
    encrypt        = true
       
  }
}
