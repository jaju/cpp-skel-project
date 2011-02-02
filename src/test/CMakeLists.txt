enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

add_executable(mmaptest mmaptest.cpp)
target_link_libraries(mmaptest ${GTEST_BOTH_LIBRARIES} pthread)

add_test(AllMmapTests mmaptest)
