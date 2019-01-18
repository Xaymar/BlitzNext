cmake_minimum_required(VERSION 2.8.12)
project(BlitzNext)

# Modules
set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/modules")

# Detect Architecture
math(EXPR BITS "8*${CMAKE_SIZEOF_VOID_P}")
if("${BITS}" STREQUAL "32")
	set(ARCH "x86")
else()
	set(ARCH "x64")
endif()

# Options
#add_definitions(-DVERSION 1108)
#add_definitions(-DBASE_VER 1108)

# Dependencies
find_package(SDL2 REQUIRED main)
find_package(FreeImage REQUIRED)
find_package(fmod REQUIRED)

# Windows
if(WIN32)
	add_definitions(
		-DNTDDI_VERSION=NTDDI_VISTA		
		-D_WIN32_WINNT=_WIN32_WINNT_VISTA
		-DWINVER=_WIN32_WINNT_VISTA
	)
endif()

# Projects
add_subdirectory(config)
add_subdirectory(stdutil)
add_subdirectory(gxruntime)
add_subdirectory(runtime)
add_subdirectory(linker)
add_subdirectory(debugger)
add_subdirectory(compiler)
