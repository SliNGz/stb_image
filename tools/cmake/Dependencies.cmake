include(FetchContent)

function(include_dependencies_cmake_files)
    set(DEPENDENCIES_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/dependencies)
    file(GLOB DEPENDENCIES_CMAKE_FILES ${DEPENDENCIES_DIRECTORY}/*.cmake)
    foreach(DEPENDENCY_CMAKE_FILE ${DEPENDENCIES_CMAKE_FILES})
        include(${DEPENDENCY_CMAKE_FILE})
    endforeach()
endfunction()

function(fetch_dependency)
	set(DEPENDENCY_NAME ${ARGV0})
	FetchContent_Declare(${ARGV})

	FetchContent_GetProperties(${DEPENDENCY_NAME})
	if(NOT ${DEPENDENCY_NAME}_POPULATED)
		FetchContent_Populate(${DEPENDENCY_NAME})

		add_subdirectory(${${DEPENDENCY_NAME}_SOURCE_DIR} ${${DEPENDENCY_NAME}_BINARY_DIR})
	endif()
	target_include_directories(${PROJECT_NAME} PRIVATE
							   ${${DEPENDENCY_NAME}_SOURCE_DIR}/include
							   ${${DEPENDENCY_NAME}_BINARY_DIR}/include)
	target_link_libraries(${PROJECT_NAME} ${DEPENDENCY_NAME})
endfunction()
