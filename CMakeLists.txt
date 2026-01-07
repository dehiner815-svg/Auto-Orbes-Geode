cmake_minimum_required(VERSION 3.24)
project(AutoOrbes)
find_package(geode-sdk REQUIRED)
setup_geode_mod(AutoOrbes SOURCES src/main.cpp)
