#
# Copyright 2011 Ravindra Jaju (jaju [AT] msync org)
#
set(LIB_NAME cpp_skel_project)
file(GLOB_RECURSE HEADER_FILES "*.h" "*.hpp" "*.hh" "*.H")
file(GLOB_RECURSE SRC_FILES "*.c" "*.cpp" "*.cc" "*.C")

option(DEBUG "Build the project with debug calls" ON)
check_include_files(list HAVE_CXX_LIST)
check_function_exists(exit HAVE_EXIT)

add_library(${LIB_NAME} SHARED ${SRC_FILES})

install(FILES
	lib${LIB_NAME}.so
	DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
	PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)

install(FILES
    ${HEADER_FILES}
	DESTINATION ${CMAKE_INSTALL_PREFIX}/include/cpp_skel_project
	PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)

