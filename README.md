# Project Template
C++ Multi-Purpose Project Template.

## Setup
* Use GitHub's "Use this template" option.
* Rename any "project_template" occurrence to your project's name.
* Delete this README.md.

## Structure
* bin - Generated folder containing output binaries categorized by platform and build type.
* build - CMake-generated folder containing generated build files.
* dependencies - Folder containing dependencies-fetching cmake files. On configure, every .cmake file in the folder gets included by the main CMakeLists.txt.
* include - Folder containing public headers.
* src - Folder containing source files.
* tools - Folder containing categorized folders of tools used by the project. For example: tools/cmake is a folder used for storing custom CMake Modules.

## Dependencies
### Adding a dependency
Create a .cmake file and place it in the "dependencies" folder.
Down below is an example of a dependency-fetching cmake file.

### example.cmake
```cmake
# Setup variables used by example project.
set(EXAMPLE_PROJECT_VARIABLE OFF CACHE INTERNAL)
set(EXAMPLE_PROJECT_BUILD_TESTS OFF CACHE INTERNAL)

# fetch_dependency is declared in Dependencies.cmake.
# For more information, checkout the documentation below.
fetch_dependency(example
                 GIT_REPOSITORY [GIT_REPOSITORY]
                 GIT_TAG [BRANCH])
```

## Dependencies.cmake
### fetch_dependency
#### Actions
* Fetches a dependency and populates it.
* Includes dependency's include directory in compilation.
* Links project against dependency.

#### Arguments:
Any argument acceptable by FetchContent_Declare.\
For more information, checkout CMake's FetchContent_Declare docs.
