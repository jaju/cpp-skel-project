# Picked and modified from: http://osdir.com/ml/kde-commits/2010-05/msg09988.html
# Another reference point: http://code.google.com/p/createtetzone/
# Locate the Google C++ Mocking Framework.

set (GMOCK_FOUND FALSE)
find_program(GMOCK-CONFIG_EXECUTABLE NAMES gmock-config PATHS)

if(GMOCK-CONFIG_EXECUTABLE)
	exec_program(${GMOCK-CONFIG_EXECUTABLE} ARGS --includedir OUTPUT_VARIABLE GMOCK_INCLUDE_DIR)
	exec_program(${GMOCK-CONFIG_EXECUTABLE} ARGS --ldflags OUTPUT_VARIABLE GMOCK_LDFLAGS)
	exec_program(${GMOCK-CONFIG_EXECUTABLE} ARGS --libs OUTPUT_VARIABLE GMOCK_libs_tmp)
	set(GMOCK_LIBRARIES ${GMOCK_LDFLAGS} ${GMOCK_libs_tmp})
endif()

if(GMOCK_INCLUDE_DIR AND GMOCK_LIBRARIES)
	set(GMOCK_FOUND TRUE)
endif()

if (NOT ${GMOCK_FOUND})
	message (FATAL_ERROR "GMOCK not found!")
endif ()
