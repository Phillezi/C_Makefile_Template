# Author:  	Philip Zingmark
# GitHub:  	https://github.com/Phillezi
# Desc:		A simple Makefile template to build c programs with gcc

CC=gcc
CFLAGS=-Wall -Wpedantic# Add your library specific flags here
DEBUG_CFLAGS=-g

SRC_DIR=src
OUT_DIR=out
TARGET=main

ifeq ($(OS), Windows_NT)
    # Windows specific
    BIN_EXT =.exe
    CFLAGS +=-lmingw32
    MKDIR = powershell -Command "if (!(Test-Path -Path $(OUT_DIR) -PathType Container)) { New-Item -ItemType Directory -Path $(OUT_DIR) }"
    RM = del /Q
else
    # Other OS (meant for Unix based os (OS X and Linux))
    BIN_EXT =
    CFLAGS +=-lm
    MKDIR = mkdir -p $(OUT_DIR)
    RM = rm -rf
endif

# Check if the src directory exists, if not prompt the user to enter the name of their src dir
ifeq ($(wildcard $(SRC_DIR)),)
$(error Source directory '$(SRC_DIR)' not found. Please specify the source directory using 'make SRC_DIR=path/to/source' or edit the makefile)
endif

# Check if the target exist in the src directory, if not prompt the user to enter the name of their target
ifeq ($(wildcard $(SRC_DIR)/$(TARGET).c),)
$(error Target source file '$(TARGET).c' not found in $(SRC_DIR). Please specify the target file using 'make TARGET=target_file_name' or edit the makefile)
endif

SRC_FILES := $(wildcard $(SRC_DIR)/*.c)

OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OUT_DIR)/%.o,$(SRC_FILES))

DEP_FILES := $(OBJ_FILES:.o=.d)

$(OUT_DIR)/%.o: $(SRC_DIR)/%.c
	$(MKDIR)
	$(CC) -c -o $@ $< $(CFLAGS)

# Include auto-generated dependency files
-include $(DEP_FILES)

all: $(TARGET)

# Target rules
debug: CFLAGS += $(DEBUG_CFLAGS)
debug: $(TARGET)

$(TARGET): $(OBJ_FILES)
	$(CC) -o $@ $^ $(CFLAGS)

.PHONY: clean

# Help message
define HELP_MESSAGE
Usage: make [target]\n
Targets:
	all            - Build the main target (default).
	debug          - Build the main target with debug symbols. Uses -g flag (default), this lets you use gdb to debug the executable.
	clean          - Remove built files.
	help           - Display this help message.\n\n
endef
export HELP_MESSAGE

# Print help message
help:
	@echo "$$HELP_MESSAGE"

# Clean the out dir and target executable
clean:
	$(RM) $(OUT_DIR) $(TARGET)
