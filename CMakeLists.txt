#
# Copyright 2011 Ravindra Jaju (jaju [AT] msync org)
#
cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules/")
###########################################################
###########################################################
project(cpp_skel_project C CXX)
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

set(LIB_NAME cpp_skel_project)
option(BUILD_WITH_COVERAGE "Build the project with code coverage on" OFF)
if(BUILD_WITH_COVERAGE)
    SET(COMPILER_COVERAGE_FLAGS "-pg -O0 -Wall -fprofile-arcs -ftest-coverage")
    SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMPILER_COVERAGE_FLAGS}")
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILER_COVERAGE_FLAGS}")
    SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fprofile-arcs -ftest-coverage -lgcov")
    include(${CMAKE_SOURCE_DIR}/cmake/lcov.cmake)
endif(BUILD_WITH_COVERAGE)

add_subdirectory(src)
add_subdirectory(test)
