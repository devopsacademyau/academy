# Make
This class is a general overview of the Make utility and the Makefile.
The main goal is to explain the purpose, the benefits and how to use it.

***Contents***
- [What is Make](#what-is-make)
- [Why use Make?](#why-use-make)
- [Makefile](#makefile)
- [Running some code](#running-some-code)
    - [Multiple Targets](#multiple-targets)
    - [Pre-Requisites](#pre-requisites)
    - [Variables](#variables)
- [Mixing together](#mixing-together)

## What is Make?
Make is a tool to execute a sequence of commands (like a recipe) based on targets defined in a specific file.
Commonly used to compile and build applications from its source code, the make utility has became very popular in the DevOps community, being used to create scripts for automation.

## Why use Make?
One of the biggest benefits of the Make utility is the ability to run in multiple platforms and shells. For example, if an engineer creates automations using bash scripts, another engineer using a different shell, like zsh, might have problems executing those scripts locally.

By using make, the same script can be used in any Linux and MacOS operating system as long as the Make utility is installed. This approach improved the collaboration in DevOps/Cloud teams and made Make a very popular tool in the community.

## Makefile
The Makefile contains the targets and instructions that will be used when the Make utility is executed. It can contain variables, conditions (`if` and `else`) and loops (like `for`).

As you can see the Makefile can be very complex and it can be used for multiple purposes. For this course and the pupose of what we'll be mostly using, we'll only cover the basics of it.

## Running some Code
Let's get our hands into the Make utility and see how it works.

The Make file is, basically, made of targets and instructions, and the syntax follow the below:

```Makefile
target: pre-requisites
    instructions
```

For the famous Hello World, we would have something like the code below to print `Hello World` in the console:

```Makefile
say_helloworld:
    @echo "Hello World"
```
By executing the command `make say_helloworld` or even just `make` without any target in the directory with a Makefile with the content above, we would get the following output:

```shell
$ make say_helloworld
Hello World
$
$ make 
Hello World
$
```
In this case, the target is `say_helloworld` and the instruction is the `@echo "Hello World"`. The target can be a binary file or just the name for the instructions, like our example above. In this case, those targets are called **phony targets**. From now on, we'll consider all our targets as phony target and we'll include the `.PHONY` directive in our Makefile, as below:

```Makefile
.PHONY: say_helloworld
say_helloworld:
    @echo "Hello World"
```
For more details of the reason behind that, you can check [this link](https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html)

Because there is a single target, if the target is not specified, the first target of the `Makefile` will be executed.

There is a convention to create the first target as `all`, so when running just `make` it will invoke several targets:

```Makefile
all: target1 target2 target3

Additionally, in the Makefile when executing a command you can use the `@` symbol preceding the command to not output the command execution in the console. Without the `@`, the output would be the following:
```shell
$ make say_helloworld
echo "Hello World"
Hello World
$
```

### Multiple Targets
Let's move to an example with multiple targets now. Consider the folowing Makefile:

```Makefile
.PHONY: create_file
create_file:
	@echo "Creating file"
	@touch output.txt
	@ls -l output.txt

.PHONY: write_to_file
write_to_file:
	echo "Writing to file" > output.txt

.PHONY: remove_file
remove_file:
	@echo "Removing file"
	rm output.txt
```

Now we have three different targets that can be invoked by running `make create_file`, `make write_to_file` and `make remove_file`.

Because we have multiple targets, by executing the `make` without any target, only the first target described in the Makefile will be executed. If you want to change the target to be executed when no target is informed, you can make use of the `.DEFAULT_GOAL` option in the beggining of the Makefile:

```Makefile
.DEFAULT_GOAL := create_file

create_file:
	@echo "Creating file"
	@touch output.txt
	@ls -l output.txt

other_targets:
...
```

### Pre-Requisites
Another interesting feature is the option to include pre-requisites for the targets. Using our previous example, we might want to create the file before writing to it(just an example as the command we're using to write to the file will also create the file). In that case, we could add the following pre-requisite to our `write_to_file` target:

```Makefile
.PHONY: create_file
create_file:
	@echo "Creating file"
	@touch output.txt
	@ls -l output.txt

.PHONY: write_to_file
write_to_file: create_file
	echo "Writing to file" > output.txt
```

By running `make write_to_file` we would have the folowing output:
```shell
$ make write_to_file
Creating file
-rw-r--r-- 1 da-academy da-academy 0 Mar  8 21:37 output.txt
echo "Writing to file" > output.txt
```

As you can see both targets were executed, since before executing the `write_to_file` target, the `create_file` target was invoked as the pre-requisite. 

### Variables
The examples above used mostly hard-coded values and in most cases, we'll need to make use of variables. Specially when running automations for multiple environments, variables will be an important feature.

Using our previous exemple, we can change the `output.txt` file to a variable and would be able to interact with different files.

```Makefile
FILE ?= output.txt

.PHONY: say_helloworld
say_helloworld:
	@echo "Hello World"

.PHONY: create_file
create_file:
	@echo "Creating file"
	@touch ${FILE}
	@ls -l ${FILE}

.PHONY: write_to_file
write_to_file: create_file
	echo "Writing to file" > ${FILE}

.PHONY: remove_file
remove_file:
	@echo "Removing file"
	rm ${FILE}
```
With the code above, we can pass any value to the `$FILE` variable and make will execute the instructions accordingly, as below:

```bash
$ FILE=out.txt make create_file
Creating file
-rw-r--r-- 1 da-academy da-academy 0 Mar  8 21:49 out.txt

$ make create_file
Creating file
-rw-r--r-- 1 da-academy da-academy 0 Mar  8 21:49 output.txt
```
Noticed that by executing the command `FILE=out.txt make create_file`, the file `out.txt` was created. Also, because we defined a default value of `output.txt` in the Makfile for the `$FILE` variable (FILE ?= output.txt), by not specifying a value during the make execution, make uses this default value.

## Mixing Together Make and Docker-Compose

Now that we know a few things about the Make utility and the Makefile, let's mix it with some other tool that we've been learning in the past few classes.

A good example would be to use a Makefile to interact with your docker containers. Consider that in order to build and test your container it requires a few long commands and sometimes some changes in variables that your container need. In that case, the Make tool could improve the deveoper and operation experience by reducing the required commands. Take [this Makefile](artifacts/mixing/Makefile) as example:

In this case, you can build your container with a quick `make build` command. To run the container, instead of a very long command  with multiple options, a `make run` can get your application ready to be tested. You can even pass some additional environment variables to your container through the make command execution, if required, as long as the Makefile is ready to understand those variables. And the image can be easyly tagged and published in your container registry with a simple `make publish` command.

As you can see, the make tool can help you in many ways and it integrates very well with manu tools from the DevOps toolset, including containers, cloud providers cli like the aws cli and IaC cli, like terraform.

## Appendix
- [Make documentation](https://www.gnu.org/software/make/manual/html_node/index.html#toc-Overview-of-make)
