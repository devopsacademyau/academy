# Labs and Exercises

For instructions on how to submit your work, [please check the main repository README here](/README.md#exercises)

## Users can upload images to their profiles

Use as base for this exercise, your solution for the exercise from the last class (API gateway -> Lambda -> DynamoDB).

**Requirements**:
- the name of the image is the email address of the user (to keep codification simpler)
- Using a Lmabda triggered by the S3 object creation, update the DynamoDB Table you created in the previous exercise to store the base64 image in a new column `photo` for that user.
