output security_group_id {
  value = aws_security_group.secgrp.id
}
output vpc_id {
  value=aws_vpc.main.id
}
output publicsubnetsids {
  value=[aws_subnet.public-subs[*].id]
}


# output az {
#   value = aws_subnet.public-subs.availability_zone
# }
