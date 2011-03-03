cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
###########################################################
###########################################################
project(hypar3 C CXX)
set(SRC_DIR ${CMAKE_SOURCE_DIR}/src)
set(TEST_DIR ${CMAKE_SOURCE_DIR}/test)
enable_testing()
###########################################################
###########################################################
include(CheckIncludeFiles)
include(CheckFunctionExists)
include_directories(${SRC_DIR})
configure_file(${SRC_DIR}/config.h.in
    ${SRC_DIR}/config.h)
add_subdirectory(src)
add_subdirectory(test)

if(BUILD_WITH_COVERAGE)
    SET(CMAKE_C_FLAGS "-g -O0 -Wall -fprofile-arcs -ftest-coverage")
    SET(CMAKE_CXX_FLAGS "-g -O0 -Wall -fprofile-arcs -ftest-coverage")
    SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-arcs -ftest-coverage -lgcov")
    include(${CMAKE_SOURCE_DIR}/cmake/lcov.cmake})
endif(BUILD_WITH_COVERAGE)
