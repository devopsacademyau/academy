resource "aws_s3_bucket" "S3" {

    bucket = "ravisenevirathne-s3"
   

    tags = {
        name = "ravisenevirathne C04-iac01"
    }
  
}
