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