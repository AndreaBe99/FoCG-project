# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build

# Include any dependencies generated for this target.
include apps/CMakeFiles/yconvert.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include apps/CMakeFiles/yconvert.dir/compiler_depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/yconvert.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/yconvert.dir/flags.make

apps/CMakeFiles/yconvert.dir/yconvert.cpp.o: apps/CMakeFiles/yconvert.dir/flags.make
apps/CMakeFiles/yconvert.dir/yconvert.cpp.o: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/apps/yconvert.cpp
apps/CMakeFiles/yconvert.dir/yconvert.cpp.o: apps/CMakeFiles/yconvert.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/CMakeFiles/yconvert.dir/yconvert.cpp.o"
	cd /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT apps/CMakeFiles/yconvert.dir/yconvert.cpp.o -MF CMakeFiles/yconvert.dir/yconvert.cpp.o.d -o CMakeFiles/yconvert.dir/yconvert.cpp.o -c /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/apps/yconvert.cpp

apps/CMakeFiles/yconvert.dir/yconvert.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/yconvert.dir/yconvert.cpp.i"
	cd /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/apps/yconvert.cpp > CMakeFiles/yconvert.dir/yconvert.cpp.i

apps/CMakeFiles/yconvert.dir/yconvert.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/yconvert.dir/yconvert.cpp.s"
	cd /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/apps/yconvert.cpp -o CMakeFiles/yconvert.dir/yconvert.cpp.s

# Object files for target yconvert
yconvert_OBJECTS = \
"CMakeFiles/yconvert.dir/yconvert.cpp.o"

# External object files for target yconvert
yconvert_EXTERNAL_OBJECTS =

/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: apps/CMakeFiles/yconvert.dir/yconvert.cpp.o
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: apps/CMakeFiles/yconvert.dir/build.make
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libyocto.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libstb_image.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libtinyexr.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libcgltf.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libimgui.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libglad.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/libglfw3.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /usr/lib/x86_64-linux-gnu/librt.a
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /usr/lib/x86_64-linux-gnu/libm.so
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: /usr/lib/x86_64-linux-gnu/libX11.so
/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert: apps/CMakeFiles/yconvert.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert"
	cd /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/yconvert.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/yconvert.dir/build: /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/bin/yconvert
.PHONY : apps/CMakeFiles/yconvert.dir/build

apps/CMakeFiles/yconvert.dir/clean:
	cd /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps && $(CMAKE_COMMAND) -P CMakeFiles/yconvert.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/yconvert.dir/clean

apps/CMakeFiles/yconvert.dir/depend:
	cd /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/apps /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps /home/andrea/Documenti/Università/fundamental-of-computer-graphics/actual-project/FoCG-project/yocto-gl/build/apps/CMakeFiles/yconvert.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/yconvert.dir/depend

