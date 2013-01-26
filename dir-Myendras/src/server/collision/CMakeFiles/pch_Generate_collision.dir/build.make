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

# Utility rule file for pch_Generate_collision.

src/server/collision/CMakeFiles/pch_Generate_collision: src/server/collision/collisionPCH.h.gch/collision_Release.gch

src/server/collision/collisionPCH.h.gch/collision_Release.gch: src/server/collision/PrecompiledHeaders/collisionPCH.h
src/server/collision/collisionPCH.h.gch/collision_Release.gch: src/server/collision/collisionPCH.h
src/server/collision/collisionPCH.h.gch/collision_Release.gch: src/server/collision/libcollision_pch_dephelp.a
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wotlkblizz/src/20120720/TrinityCore/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating collisionPCH.h.gch/collision_Release.gch"
	cd /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision && /usr/bin/c++ -O3 -DNDEBUG -I/usr/include -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/collision -I/home/wotlkblizz/src/20120720/TrinityCore/dep/g3dlite/include -I/home/wotlkblizz/src/20120720/TrinityCore/dep/recastnavigation/Detour -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Configuration -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Debugging -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Database -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Dynamic -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Dynamic/LinkedReference -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Logging -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Threading -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Packets -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/Utilities -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/shared/DataStores -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Addons -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Conditions -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Entities/Item -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Entities/GameObject -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Entities/Creature -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Entities/Object -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Entities/Object/Updates -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Entities/Unit -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Combat -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Loot -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Miscellaneous -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Grids -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Grids/Cells -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Grids/Notifiers -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Maps -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/DataStores -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Movement/Waypoints -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Movement/Spline -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Movement -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Server -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Server/Protocol -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/World -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Spells -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/game/Spells/Auras -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/Management -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/Maps -I/home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/Models -I/home/wotlkblizz/src/20120720/TrinityCore -I/home/wotlkblizz/.sys/include -I/usr/include/mysql -D_BUILD_DIRECTIVE='"Release"' -fno-delete-null-pointer-checks -DHAVE_SSE2 -D__SSE2__ --no-warnings -DSCRIPTS -fno-delete-null-pointer-checks -D_BUILD_DIRECTIVE='"Release"' -fno-delete-null-pointer-checks -DHAVE_SSE2 -D__SSE2__ --no-warnings -DSCRIPTS -x c++-header -o /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/collisionPCH.h.gch/collision_Release.gch /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/collisionPCH.h

src/server/collision/collisionPCH.h: src/server/collision/PrecompiledHeaders/collisionPCH.h
	$(CMAKE_COMMAND) -E cmake_progress_report /home/wotlkblizz/src/20120720/TrinityCore/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Generating collisionPCH.h"
	cd /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision && /usr/bin/cmake -E copy /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/PrecompiledHeaders/collisionPCH.h /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/collisionPCH.h

pch_Generate_collision: src/server/collision/CMakeFiles/pch_Generate_collision
pch_Generate_collision: src/server/collision/collisionPCH.h.gch/collision_Release.gch
pch_Generate_collision: src/server/collision/collisionPCH.h
pch_Generate_collision: src/server/collision/CMakeFiles/pch_Generate_collision.dir/build.make
.PHONY : pch_Generate_collision

# Rule to build all files generated by this target.
src/server/collision/CMakeFiles/pch_Generate_collision.dir/build: pch_Generate_collision
.PHONY : src/server/collision/CMakeFiles/pch_Generate_collision.dir/build

src/server/collision/CMakeFiles/pch_Generate_collision.dir/clean:
	cd /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision && $(CMAKE_COMMAND) -P CMakeFiles/pch_Generate_collision.dir/cmake_clean.cmake
.PHONY : src/server/collision/CMakeFiles/pch_Generate_collision.dir/clean

src/server/collision/CMakeFiles/pch_Generate_collision.dir/depend:
	cd /home/wotlkblizz/src/20120720/TrinityCore && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/wotlkblizz/src/20120720/TrinityCore /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision /home/wotlkblizz/src/20120720/TrinityCore /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision /home/wotlkblizz/src/20120720/TrinityCore/src/server/collision/CMakeFiles/pch_Generate_collision.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/server/collision/CMakeFiles/pch_Generate_collision.dir/depend

