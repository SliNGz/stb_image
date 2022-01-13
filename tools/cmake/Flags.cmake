# Compiler flags
include(flags/compilers/${CMAKE_CXX_COMPILER_ID} OPTIONAL)

# Platform flags
include(flags/platforms/${CMAKE_SYSTEM_NAME} OPTIONAL)