#
# Copyright 2011 Ravindra Jaju (jaju [AT] msync org)
#
find_package(GTest REQUIRED)
find_package(GMock REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(${GOOGLEMOCK_INCLUDE_DIR})

file(GLOB_RECURSE TEST_FILES_CPP "*Test.cpp" "*test.cpp")

foreach(testfile ${TEST_FILES_CPP})
    get_filename_component(testname ${testfile} NAME_WE)
    add_executable(${testname} ${testfile})
    target_link_libraries(${testname} ${GTEST_BOTH_LIBRARIES} ${GMOCK_LIBRARIES} ${LIB_NAME} pthread) 
    add_test(${testname} ${testname})
endforeach()
