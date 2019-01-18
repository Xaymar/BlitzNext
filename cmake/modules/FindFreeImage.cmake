# Find FreeImage (and components)
#
#Variable				Type		Description
# FreeImage_FOUND			BOOL		Did we find FreeImage?
# FreeImage_INCLUDE_DIRS		LIST/PATH	List of paths to all include directories
# FreeImage_LIBRARIES		LIST/FILE	List of files to link against
# FreeImage_BINARIES			LIST/FILE	Binary files for FreeImage
# FreeImage_VERSION_STRING	STRING		FreeImage Version String
#

# Options
set(FreeImage_DIR "" CACHE PATH "Path to FreeImage Library")

# Find code
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(_lib_arch 64)
else()
	set(_lib_arch 86)
endif()
if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(_lib_suffix 64)
else()
	set(_lib_suffix 32)
endif()
if(WIN32)
	set(_lib_ext .dll)
else()
	set(_lib_ext .so)
endif()

set(FreeImage_FOUND FALSE)
set(FreeImage_INCLUDE_DIRS)
set(FreeImage_LIBRARIES)
set(FreeImage_BINARIES)
set(FreeImage_VERSION_STRING)

function(find_freeimage)
	set(FreeImage_FOUND FALSE PARENT_SCOPE)
	set(FreeImage_INCLUDE_DIRS PARENT_SCOPE)
	set(FreeImage_LIBRARIES PARENT_SCOPE)
	set(FreeImage_BINARIES PARENT_SCOPE)
	set(FreeImage_VERSION_STRING PARENT_SCOPE)
	
	mark_as_advanced(
		FreeImage_FOUND
		FreeImage_INCLUDE_DIRS
		FreeImage_LIBRARIES
		FreeImage_BINARIES
		FreeImage_VERSION_STRING
	)

	set(FreeImage_INCLUDE_DIR)
	set(FreeImage_LIBRARY)
	set(FreeImage_BINARY)
	find_path(FreeImage_INCLUDE_DIR
		NAMES
			"FreeImage.h"
		HINTS
			${FreeImagePath${_lib_suffix}}
			${FreeImagePath}
			${FreeImage_DIR}
		PATHS
			/usr/include /usr/local/include /opt/local/include /sw/include
		PATH_SUFFIXES
			Dist/x${_lib_arch}
			Dist/x${_lib_suffix}
			Dist
			include
			inc
	)
	find_file(FreeImage_LIBRARY
		"FreeImage.lib"
		HINTS
			${FreeImagePath${_lib_suffix}}
			${FreeImagePath}
			${FreeImage_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
			Dist Dist/x${_lib_suffix}
			lib/x${_lib_arch} libx${_lib_arch} ../lib/x${_lib_arch} ../libx${_lib_arch} 
			lib/${_lib_suffix} lib${_lib_suffix} ../lib/${_lib_suffix} ../lib${_lib_suffix}
			lib ../lib
			libs/x${_lib_arch} libsx${_lib_arch} ../libs/x${_lib_arch} ../libsx${_lib_arch} 
			libs/${_lib_suffix} libs${_lib_suffix} ../libs/${_lib_suffix} ../libs${_lib_suffix}
			libs ../libs
			bin/x${_lib_arch} binx${_lib_arch} ../bin/x${_lib_arch} ../binx${_lib_arch} 
			bin/${_lib_suffix} bin${_lib_suffix} ../bin/${_lib_suffix} ../bin${_lib_suffix}
			bin ../bin
	)
	find_file(FreeImage_BINARY
		"FreeImage${_lib_ext}"
		HINTS
			${FreeImagePath${_lib_suffix}}
			${FreeImagePath}
			${FreeImage_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
			Dist Dist/x${_lib_suffix}
			lib/x${_lib_arch} libx${_lib_arch} ../lib/x${_lib_arch} ../libx${_lib_arch} 
			lib/${_lib_suffix} lib${_lib_suffix} ../lib/${_lib_suffix} ../lib${_lib_suffix}
			lib ../lib
			libs/x${_lib_arch} libsx${_lib_arch} ../libs/x${_lib_arch} ../libsx${_lib_arch} 
			libs/${_lib_suffix} libs${_lib_suffix} ../libs/${_lib_suffix} ../libs${_lib_suffix}
			libs ../libs
			bin/x${_lib_arch} binx${_lib_arch} ../bin/x${_lib_arch} ../binx${_lib_arch} 
			bin/${_lib_suffix} bin${_lib_suffix} ../bin/${_lib_suffix} ../bin${_lib_suffix}
			bin ../bin
	)
	
	if(FreeImage_INCLUDE_DIR AND FreeImage_LIBRARY)
		set(FreeImage_FOUND TRUE PARENT_SCOPE)
		set(FreeImage_INCLUDE_DIRS ${FreeImage_INCLUDE_DIR} PARENT_SCOPE)
		set(FreeImage_LIBRARIES ${FreeImage_LIBRARY} PARENT_SCOPE)		
		set(FreeImage_BINARIES ${FreeImage_BINARY} PARENT_SCOPE)
		
		set(_vfile "${FreeImage_INCLUDE_DIR}/FreeImage.h")
		if(EXISTS "${_vfile}")
			file(STRINGS "${_vfile}" _version_parse REGEX "^.*FREEIMAGE_(MAJOR|MINOR)_VERSION[ \t]+[0-9]+[ \t]*$")
			string(REGEX REPLACE ".*FREEIMAGE_MAJOR_VERSION[ \t]+([0-9]+).*" "\\1" _major "${_version_parse}")
			string(REGEX REPLACE ".*FREEIMAGE_MINOR_VERSION[ \t]+([0-9]+).*" "\\1" _minor "${_version_parse}")

			set(FreeImage_VERSION_MAJOR "${_major}" PARENT_SCOPE)
			set(FreeImage_VERSION_MINOR "${_minor}" PARENT_SCOPE)

			set(FreeImage_VERSION_STRING "${_major}.${_minor}" PARENT_SCOPE)
		else()
			message(STATUS "Failed parsing FreeImage version")
		endif()
	endif()
endfunction()

# Library
find_freeimage()

# Default
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FreeImage
	FOUND_VAR FreeImage_FOUND
	REQUIRED_VARS FreeImage_LIBRARIES FreeImage_INCLUDE_DIRS FreeImage_BINARIES
	VERSION_VAR FreeImage_VERSION_STRING
)
