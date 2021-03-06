all:
	test "$(subst e,EE,hello)" = "hEEllo"
	test "$(strip $(NULL)  test data  )" = "test data"
	test "$(findstring hell,hello)" = "hell"
	test "$(findstring heaven,hello)" = ""
	test "$(filter foo/%.c b%,foo/a.c b.c foo/a.o)" = "foo/a.c b.c"
	test "$(filter foo,foo bar)" = "foo"
	test "$(filter-out foo/%.c b%,foo/a.c b.c foo/a.o)" = "foo/a.o"
	test "$(filter-out %.c,foo,bar.c foo,bar.o)" = "foo,bar.o"
	test "$(sort .go a b aa A c cc)" = ".go A a aa b c cc"
	test "$(word 1, hello )" = "hello"
	test "$(word 2, hello )" = ""
	test "$(wordlist 1, 2, foo bar baz )" = "foo bar"
	test "$(words 1 2 3)" = "3"
	test "$(words )" = "0"
	test "$(firstword $(NULL) foo bar baz)" = "foo"
	test "$(firstword )" = ""
	test "$(dir foo.c path/foo.o dir/dir2/)" = "./ path/ dir/dir2/"
	test "$(notdir foo.c path/foo.o dir/dir2/)" = "foo.c foo.o "
	test "$(suffix src/foo.c dir/my.dir/foo foo.o)" = ".c .o"
	test "$(basename src/foo.c dir/my.dir/foo foo.c .c)" = "src/foo dir/my.dir/foo foo "
	test "$(addprefix src/,foo bar.c dir/foo)" = "src/foo src/bar.c src/dir/foo"
	test "$(addsuffix .c,foo dir/bar)" = "foo.c dir/bar.c"
	test "$(join a b c, 1 2 3)" = "a1 b2 c3"
	test "$(join a b, 1 2 3)" = "a1 b2 3"
	test "$(join a b c, 1 2)" = "a1 b2 c"
	test "$(if $(NULL) ,yes)" = ""
	test "$(if 1,yes,no)" = "yes"
	test "$(if ,yes,no )" = "no "
	test "$(if ,$(error Short-circuit problem))" = ""
	test "$(or $(NULL),1)" = "1"
	test "$(or $(NULL),2,$(warning TEST-FAIL bad or short-circuit))" = "2"
	test "$(and ,$(warning TEST-FAIL bad and short-circuit))" = ""
	test "$(and 1,2)" = "2"
	test "$(foreach i,foo bar,found:$(i))" = "found:foo found:bar"
	@echo TEST-PASS
