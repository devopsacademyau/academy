output "efs_id" {
    value = aws_efs_file_system.project_efs.id
    description = "The id of the efs"
} 