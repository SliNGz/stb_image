cmake_minimum_required(VERSION 3.14)

project(project_template)

# Modules
set(CMAKE_TOOLS_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake)
include(${CMAKE_TOOLS_DIR}/Dependencies.cmake)

# Sources
file(GLOB_RECURSE SOURCES
	 "include/*.h"
	 "src/*.cpp")

# Target
add_executable(${PROJECT_NAME} ${SOURCES})

# Flags
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)
include(${CMAKE_TOOLS_DIR}/Flags.cmake)

# Binaries output directory
set(OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})
set_target_properties(${PROJECT_NAME} PROPERTIES
					  ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY}
					  LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY}
					  RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
						   ${CMAKE_CURRENT_SOURCE_DIR}/include)

# Dependencies
set(FETCHCONTENT_QUIET OFF)
include_dependencies_cmake_files()
