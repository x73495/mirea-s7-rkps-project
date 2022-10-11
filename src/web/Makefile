COMPILER := emcc
SOURCES_EXT := c

DIR_SOURCE := src
DIR_BUILD := ../../build/web

INCLUDES := -I ../../include
LINKS :=

FLAGS_COMPILER := -std=c99 -Wall -Wextra -pedantic
FLAGS_COMPILER_SUPPRESS := -Wno-infinite-recursion -Wno-extra-semi
FLAGS_COMPILER += $(FLAGS_COMPILER_SUPPRESS)

FLAGS_CPPCHECK := -q --std=c99 --enable=all --inconclusive $(INCLUDES)
FLAGS_CPPCHECK_SUPPRESS := --suppress=missingIncludeSystem --suppress=unusedFunction
FLAGS_CPPCHECK += $(FLAGS_CPPCHECK_SUPPRESS)

SOURCES := $(wildcard $(DIR_SOURCE)/*.$(SOURCES_EXT))
OBJECTS := $(patsubst $(DIR_SOURCE)/%,$(DIR_BUILD)/%,$(SOURCES:.$(SOURCES_EXT)=.o))

BUILD_TARGETS := $(DIR_BUILD)/%.o

ifeq ($(OS),Windows_NT)
	LINKS += -lmingw32

	CMD_CPPCHECK := C:\Program Files\Cppcheck\cppcheck.exe

	CMD_RM := rd /s /q
	CMD_MKDIR_OUTPUT := if not exist "$(DIR_OUTPUT)" md "$(DIR_OUTPUT)"
	CMD_MKDIR_BUILD := if not exist "$(DIR_BUILD)" md "$(DIR_BUILD)"
else
	CMD_CPPCHECK := cppcheck

	CMD_RM := rm -rf
	CMD_MKDIR_OUTPUT := mkdir -p $(DIR_OUTPUT)
	CMD_MKDIR_BUILD := mkdir -p $(DIR_BUILD)
endif


$(OBJECTS): $(SOURCES)
	@echo
	@echo " проверка" $<
	$(CMD_CPPCHECK) $(FLAGS_CPPCHECK) $(INCLUDES_DEFAULT) $<

	@echo
	@echo " сборка" $@
	$(CMD_MKDIR_BUILD)
	$(COMPILER) $(FLAGS_COMPILER) $(INCLUDES) -c -o $@ $<

clean:
	$(CMD_RM) $(DIR_BUILD)

.PHONY: clean