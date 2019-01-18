# Find SDL2 (and components)
#
#Variable				Type		Description
# SDL2_FOUND			BOOL		Did we find SDL2?
# SDL2_INCLUDE_DIRS		LIST/PATH	List of paths to all include directories
# SDL2_LIBRARIES		LIST/FILE	List of files to link against
# SDL2_BINARIES			LIST/FILE	Binary files for SDL2
# SDL2_VERSION_STRING	STRING		SDL2 Version String
#
#Components:
#Variable				Type		Description
# SDL2_comp_FOUND		BOOL		Found <comp>onent?
# SDL2_comp_LIBRARIES	LIST/FILE	Path to <comp>onent library files

# Options
set(SDL2_DIR "" CACHE PATH "Path to SDL2 Library")

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

set(SDL2_FOUND FALSE)
set(SDL2_INCLUDE_DIRS)
set(SDL2_LIBRARIES)
set(SDL2_BINARIES)
set(SDL2_VERSION_STRING)

function(find_sdl2)
	set(SDL2_FOUND FALSE PARENT_SCOPE)
	set(SDL2_INCLUDE_DIRS PARENT_SCOPE)
	set(SDL2_LIBRARIES PARENT_SCOPE)
	set(SDL2_BINARIES PARENT_SCOPE)
	set(SDL2_VERSION_STRING PARENT_SCOPE)
	
	mark_as_advanced(
		SDL2_FOUND
		SDL2_INCLUDE_DIRS
		SDL2_LIBRARIES
		SDL2_BINARIES
		SDL2_VERSION_STRING
	)

	set(SDL2_INCLUDE_DIR)
	set(SDL2_LIBRARY)
	set(SDL2_BINARY)
	find_path(SDL2_INCLUDE_DIR
		NAMES
			"SDL.h" "SDL_version.h"
		HINTS
			${SDL2Path${_lib_suffix}}
			${SDL2Path}
			${SDLPath${_lib_suffix}}
			${SDLPath}
			${SDL2_DIR}
			${SDL_DIR}
		PATHS
			/usr/include /usr/local/include /opt/local/include /sw/include
		PATH_SUFFIXES
			sdl2/include include sdl/include
	)
	find_file(SDL2_LIBRARY
		"SDL2.lib"
		HINTS
			${SDL2Path${_lib_suffix}}
			${SDL2Path}
			${SDLPath${_lib_suffix}}
			${SDLPath}
			${SDL2_DIR}
			${SDL_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
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
	find_file(SDL2_BINARY
		"SDL2${_lib_ext}"
		HINTS
			${SDL2Path${_lib_suffix}}
			${SDL2Path}
			${SDLPath${_lib_suffix}}
			${SDLPath}
			${SDL2_DIR}
			${SDL_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
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
	
	if(SDL2_INCLUDE_DIR AND SDL2_LIBRARY)
		set(SDL2_FOUND TRUE PARENT_SCOPE)
		set(SDL2_INCLUDE_DIRS ${SDL2_INCLUDE_DIR} PARENT_SCOPE)
		set(SDL2_LIBRARIES ${SDL2_LIBRARY} PARENT_SCOPE)		
		set(SDL2_BINARIES ${SDL2_BINARY} PARENT_SCOPE)
		
		set(_vfile "${SDL2_INCLUDE_DIR}/SDL_version.h")
		if(EXISTS "${_vfile}")
			file(STRINGS "${_vfile}" _version_parse REGEX "^.*SDL_(MAJOR|MINOR)_VERSION[ \t]+[0-9]+[ \t]*$")
			string(REGEX REPLACE ".*SDL_MAJOR_VERSION[ \t]+([0-9]+).*" "\\1" _major "${_version_parse}")
			string(REGEX REPLACE ".*SDL_MINOR_VERSION[ \t]+([0-9]+).*" "\\1" _minor "${_version_parse}")

			set(SDL2_VERSION_MAJOR "${_major}" PARENT_SCOPE)
			set(SDL2_VERSION_MINOR "${_minor}" PARENT_SCOPE)

			set(SDL2_VERSION_STRING "${_major}.${_minor}" PARENT_SCOPE)
		else()
			message(STATUS "Failed parsing SDL2 version")
		endif()
	endif()
endfunction()

function(find_sdl2_component component)
	string(TOUPPER "${component}" component_u)
	set(SDL2_${component_u}_FOUND FALSE PARENT_SCOPE)
	set(SDL2_${component}_FOUND FALSE PARENT_SCOPE)
	set(SDL2_${component_u}_LIBRARIES PARENT_SCOPE)
	set(SDL2_${component}_LIBRARIES PARENT_SCOPE)
	
	mark_as_advanced(
		SDL2_${component_u}_FOUND
		SDL2_${component}_FOUND
		SDL2_${component_u}_LIBRARIES
		SDL2_${component}_LIBRARIES
		SDL2_${component_u}_BINARIES
		SDL2_${component}_BINARIES
	)
	
	if(NOT SDL2_FOUND)
		message(STATUS "SDL2 not found, not looking for components.")
		return()
	endif()
	
	# Find component
	set(SDL2_${component_u}_LIBRARY)
	find_file(SDL2_${component_u}_LIBRARY
		"SDL2${component}.lib"
		HINTS
			${SDL2Path${_lib_suffix}}
			${SDL2Path}
			${SDLPath${_lib_suffix}}
			${SDLPath}
			${SDL2_DIR}
			${SDL_DIR}
		PATHS
			/usr/lib /usr/local/lib /opt/local/lib /sw/lib
		PATH_SUFFIXES
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
	
	if(SDL2_${component_u}_LIBRARY)
		set(SDL2_${component_u}_FOUND TRUE PARENT_SCOPE)
		set(SDL2_${component}_FOUND TRUE PARENT_SCOPE)
		set(SDL2_${component_u}_LIBRARIES ${SDL2_${component_u}_LIBRARY} PARENT_SCOPE)
		set(SDL2_${component}_LIBRARIES ${SDL2_${component_u}_LIBRARY} PARENT_SCOPE)
		
		list(APPEND SDL2_LIBRARIES ${SDL2_${component_u}_LIBRARIES})
		list(REMOVE_DUPLICATES SDL2_LIBRARIES)
		set(SDL2_LIBRARIES "${SDL2_LIBRARIES}" PARENT_SCOPE)
	endif()
endfunction()

# Library
find_sdl2()

# Components
list(GET SDL2_FIND_COMPONENTS 0 _first_comp)
string(TOUPPER "${_first_comp}" _first_comp)

foreach(component ${SDL2_FIND_COMPONENTS})
	if(component STREQUAL "main")
		find_sdl2_component("${component}")
	elseif(component STREQUAL "test")
		find_sdl2_component("${component}")
	else()
		message(FATAL_ERROR "Unknown FFmpeg component requested: ${component}")
	endif()
endforeach()

# Default
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(SDL2
	FOUND_VAR SDL2_FOUND
	REQUIRED_VARS SDL2_LIBRARIES SDL2_INCLUDE_DIRS SDL2_BINARIES
	VERSION_VAR SDL2_VERSION_STRING
)
