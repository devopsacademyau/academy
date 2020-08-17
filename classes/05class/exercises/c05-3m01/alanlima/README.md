# C05-3M01

## Make

- [Dockerfile](Dockerfile)
- [scripts/create_bucket.sh](scripts/create_bucket.sh)
- [scripts/delete_bucket.sh](scripts/delete_bucket.sh)
- [.env](.env)
- [Makefile](Makefile)

## Command Execution Output

### create_bucket

```bash
$ BUCKET_NAME=alanlima-abc make create_bucket

🤖: Ok sir, I will do your job and create the bucket 'alanlima-abc' for you
make_bucket: alanlima-abc
🤖: All Done ✅... bucket created. Enjoy while you can 😏
```

### delete_bucket

```bash
$ BUCKET_NAME=alanlima-abc make delete_bucket

🤖: So I just created the bucket 'alanlima-abc', and now you want to delete?!? 
🤖: Fine, I will do it against my will 😣
remove_bucket: alanlima-abc
🤖: As you wish, bucket deleted... ❌❌❌
🤖: I might have put your most important things inside the bucket and deleted it all together... but who cares??
```

## list_bucket_objects

```bash
$ BUCKET_NAME=alanlima-abc make list_bucket_objects
🤖: You again, I cannot even enjoy my standby moments in peace.
🤖: So now you want me to give you a list of the objects?
🤖: Such a lazy human, just go to the aws console 😑. Fine here is the list:

Total Objects: 0
   Total Size: 0 Bytes

🤖: anything else? maybe a mojito cocktail 🍸?
```

## Command Explanations

```text
3M patterns allows developers to use any tool they want and however version fancy them.
Developers don't need to worry anymore about installing and configuring tools in your local machine
or hours of headache with version incompatibility.
Do you like to test a brand-new really cool feature that it is in preview and you don't want to mess up with your environment? 
Just docker it up and run in the container.

Both commands will use an image which has awscli and make cli installed so we only need to pass is the AWS authentication variables.
Since that we wrap all the code inside bash scripts, 
we can just run the container with the volume mounted to our app directory and call the script inside the container.
Temporary files can be created inside the container and it will all be deleted when the container is removed.
```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c05-3m01](<WIP>)