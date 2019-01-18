# Find fmod (and components)
#
#Variable				Type		Description
# fmod_FOUND			BOOL		Did we find fmod?
# fmod_INCLUDE_DIRS		LIST/PATH	List of paths to all include directories
# fmod_LIBRARIES		LIST/FILE	List of files to link against
# fmod_BINARIES			LIST/FILE	Binary files for fmod
# fmod_VERSION_STRING	STRING		fmod Version String

# Options
set(fmod_DIR "" CACHE PATH "Path to fmod Library")

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

set(fmod_FOUND FALSE)
set(fmod_INCLUDE_DIRS)
set(fmod_LIBRARIES)
set(fmod_BINARIES)
set(fmod_VERSION_STRING)

function(find_fmod)
	set(fmod_FOUND FALSE PARENT_SCOPE)
	set(fmod_INCLUDE_DIRS PARENT_SCOPE)
	set(fmod_LIBRARIES PARENT_SCOPE)
	set(fmod_BINARIES PARENT_SCOPE)
	set(fmod_VERSION_STRING PARENT_SCOPE)
	
	mark_as_advanced(
		fmod_FOUND
		fmod_INCLUDE_DIRS
		fmod_LIBRARIES
		fmod_BINARIES
		fmod_VERSION_STRING
	)

	set(fmod_INCLUDE_DIR)
	set(fmod_LIBRARY)
	set(fmod_BINARY)
	find_path(fmod_INCLUDE_DIR
		NAMES
			"fmod.h"
		HINTS
			${fmodPath${_lib_suffix}}
			${fmodPath}
			${fmod_DIR}
		PATHS
			/usr/include /usr/local/include /opt/local/include /sw/include
		PATH_SUFFIXES
			fmod
			fmod/inc
			inc
			fmod/include
			include
			fmod/api
			api
			fmod/api/inc
			api/inc
	)
	find_file(fmod_LIBRARY
		"fmod${_lib_suffix}vc.lib" "fmodvc.lib"
		HINTS
			${fmodPath${_lib_suffix}}
			${fmodPath}
			${fmod_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
			fmod
			fmod/api
			api
			fmod/api/lib
			api/lib
	)
	find_file(fmod_BINARY
		NAMES "fmod${_lib_suffix}${_lib_ext}" "fmod${_lib_ext}"
		HINTS
			${fmodPath${_lib_suffix}}
			${fmodPath}
			${fmod_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
			fmod
			fmod/api
			api
	)
	
	if(fmod_INCLUDE_DIR AND fmod_LIBRARY)
		set(fmod_FOUND TRUE PARENT_SCOPE)
		set(fmod_INCLUDE_DIRS ${fmod_INCLUDE_DIR} PARENT_SCOPE)
		set(fmod_LIBRARIES ${fmod_LIBRARY} PARENT_SCOPE)		
		set(fmod_BINARIES ${fmod_BINARY} PARENT_SCOPE)
		
		set(_vfile "${fmod_INCLUDE_DIR}/fmod.h")
		if(EXISTS "${_vfile}")
			file(STRINGS "${_vfile}" _version_parse REGEX "^.*FMOD_VERSION[ \t]+[0-9]+.[0-9]+f[ \t]*$")
			string(REGEX REPLACE ".*FMOD_VERSION[ \t]+([0-9]+).*" "\\1" _major "${_version_parse}")
			string(REGEX REPLACE ".*FMOD_VERSION[ \t]+[0-9]+.([0-9]+).*" "\\1" _minor "${_version_parse}")

			set(fmod_VERSION_MAJOR "${_major}" PARENT_SCOPE)
			set(fmod_VERSION_MINOR "${_minor}" PARENT_SCOPE)

			set(fmod_VERSION_STRING "${_major}.${_minor}" PARENT_SCOPE)
		else()
			message(STATUS "Failed parsing fmod version")
		endif()
	endif()
endfunction()

# Library
find_fmod()

# Default
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(fmod
	FOUND_VAR fmod_FOUND
	REQUIRED_VARS fmod_LIBRARIES fmod_INCLUDE_DIRS fmod_BINARIES
	VERSION_VAR fmod_VERSION_STRING
)
