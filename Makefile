FLAGS = -i include -w unquoted-string -w redefinition-wo-undef -f

all:
	@armake build ${FLAGS} mission_template mission_template.pbo

test:
	@sqflint -d mission_template

clean:
	rm -rf $(BIN)

