# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/wotlkblizz/src/20120720/TrinityCore

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/wotlkblizz/src/20120720/TrinityCore

# Utility rule file for revision.h.

src/genrev/CMakeFiles/revision.h:
	/usr/bin/cmake -DBUILDDIR=/home/wotlkblizz/src/20120720/TrinityCore -P /home/wotlkblizz/src/20120720/TrinityCore/cmake/genrev.cmake

revision.h: src/genrev/CMakeFiles/revision.h
revision.h: src/genrev/CMakeFiles/revision.h.dir/build.make
.PHONY : revision.h

# Rule to build all files generated by this target.
src/genrev/CMakeFiles/revision.h.dir/build: revision.h
.PHONY : src/genrev/CMakeFiles/revision.h.dir/build

src/genrev/CMakeFiles/revision.h.dir/clean:
	cd /home/wotlkblizz/src/20120720/TrinityCore/src/genrev && $(CMAKE_COMMAND) -P CMakeFiles/revision.h.dir/cmake_clean.cmake
.PHONY : src/genrev/CMakeFiles/revision.h.dir/clean

src/genrev/CMakeFiles/revision.h.dir/depend:
	cd /home/wotlkblizz/src/20120720/TrinityCore && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wotlkblizz/src/20120720/TrinityCore /home/wotlkblizz/src/20120720/TrinityCore/src/genrev /home/wotlkblizz/src/20120720/TrinityCore /home/wotlkblizz/src/20120720/TrinityCore/src/genrev /home/wotlkblizz/src/20120720/TrinityCore/src/genrev/CMakeFiles/revision.h.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/genrev/CMakeFiles/revision.h.dir/depend

