cmake_minimum_required(VERSION 3.7)

project(project_template)

# Modules
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake)
include(ListDirectories)

# Binaries output directory (affects libraries as well)
set(OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/${CMAKE_SYSTEM_NAME}/${CMAKE_BUILD_TYPE})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIRECTORY})

# Sources
file(GLOB_RECURSE SOURCES
	 "include/*.h"
	 "src/*.cpp")

# Target
add_executable(${PROJECT_NAME} ${SOURCES})

# Flags
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_20)
target_compile_options(${PROJECT_NAME} PRIVATE "-W4")

# Include directories
target_include_directories(${PROJECT_NAME} PRIVATE
						   ${CMAKE_CURRENT_SOURCE_DIR}/include/${PROJECT_NAME})

# Libraries
set(LIBRARIES_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/libs)
list_directories(LIBRARIES ${LIBRARIES_DIRECTORY})
foreach(LIBRARY ${LIBRARIES})
	set(LIBRARY_DIRECTORY ${LIBRARIES_DIRECTORY}/${LIBRARY})
	add_subdirectory(${LIBRARY_DIRECTORY})
	target_link_libraries(${PROJECT_NAME} ${LIBRARY})
	target_include_directories(${PROJECT_NAME} PUBLIC
						   	   ${LIBRARY_DIRECTORY}/include)
endforeach()