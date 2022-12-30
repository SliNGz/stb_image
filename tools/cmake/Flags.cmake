# Compiler flags
include(${CMAKE_TOOLS_DIR}/flags/compilers/${CMAKE_CXX_COMPILER_ID}.cmake OPTIONAL)

# Platform flags
include(${CMAKE_TOOLS_DIR}/flags/platforms/${CMAKE_SYSTEM_NAME}.cmake OPTIONAL)
