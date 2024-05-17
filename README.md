# CPP-Project-Scripts
Some shell scripts I wrote to facilitate the tedious and repetitive parts of 42's C++ projects.

On my PC, I added the scripts to a folder in the `$PATH` environment variable and created aliases to make them easier to use.

<br>

# Usage

newMake creates a template Makefile, missing only the executable, source and header file names.
```Shell
./newMake.sh
```
<br>

newClass creates the files `<Classname>.hpp` and `<Classname>.cpp`.
```Shell
./newClass.sh <ClassName>
```
  *  `<ClassName>.hpp` contains include guards and the basic structure of a class named `<ClassName>`.
  *  `<ClassName>.cpp` contains the `<ClassName>.hpp` dependency and the default constructor and destructor.
