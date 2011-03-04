#
# Copyright 2011 Ravindra Jaju (jaju [AT] msync org)
#
find_package(GTest REQUIRED)
find_package(GMock REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
include_directories(${GOOGLEMOCK_INCLUDE_DIR})

add_executable(mmaptest mmaptest.cpp)
target_link_libraries(mmaptest ${GTEST_BOTH_LIBRARIES} ${GOOGLEMOCK_LIBRARIES} pthread)

add_test(AllMmapTests mmaptest)
