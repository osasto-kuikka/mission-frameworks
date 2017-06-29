FLAGS = -i include -w unquoted-string -w redefinition-wo-undef -f

all:
	@armake build ${FLAGS} full full.pbo
	@armake build ${FLAGS} min min.pbo

test:
	@sqflint -d full
	@sqflint -d min

clean:
	rm -rf $(BIN)

