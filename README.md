# Simple Makefile Template for C Projects

This is a straightforward Makefile template designed for building C projects using GCC.
It is designed to keep things neat by putting object files in a out directory and the finished executable in the root directory.

## Installation

You can use this template repository as a template by clicking `Use this template` and then `Create a new repository`, click [here](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) to see a tutorial.

**Otherwise you can:**


Download a zip of this repository by pressing the green `Code` button.


or


Clone the github repo and remove the `.git` (so you can create your own repository):

**On Linux**
```bash
git clone --depth 1 --no-single-branch https://github.com/Phillezi/C_Makefile_Template.git
cd C_Makefile_Template
rm -rf .git
```

**On Windows**,
I havent tried this, but it should work:
```ps
git clone --depth 1 --no-single-branch https://github.com/Phillezi/C_Makefile_Template.git
cd C_Makefile_Template
del /Q .git
```

### Linux
To just get the makefile:
```bash
wget https://github.com/Phillezi/C_Makefile_Template/blob/master/makefile
```

## Instructions
### Windows

*This assumes you are using mingw32.*
To build the project, simply run the following command. Since `all` is the first target in the Makefile, it will be executed by default. This command compiles all the `.c` files in the `src` directory into `.o` files and then links them to an executable specified in the Makefile (Target).

```ps
mingw32-make.exe
```

To build the project with debug flags, use the `debug` target. By default, it includes the `-g` flag for debugging information, this lets you debug the executable with programs like GDB.

```ps
mingw32-make.exe debug
```

For a list of available Makefile targets and their descriptions, you can use the `help` target.

```ps
mingw32-make.exe help
```

### Unix-based (OS X / Linux)

To build the project, simply run the following command. Since `all` is the first target in the Makefile, it will be executed by default. This command compiles all the `.c` files in the `src` directory into `.o` files and then links them to an executable specified in the Makefile (Target).

```bash
make
```

To build the project with debug flags, use the `debug` target. By default, it includes the `-g` flag for debugging information, this lets you debug the executable with programs like GDB.

```bash
make debug
```

For a list of available Makefile targets and their descriptions, you can use the `help` target.

```bash
make help
```

Once the program is compiled, the object files will be stored in the `out` directory, and the executable will be generated in the root directory (the same directory as the Makefile).

Feel free to modify the Makefile to suit your project's specific requirements.
