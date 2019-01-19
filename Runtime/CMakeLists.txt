project(runtime)

add_subdirectory(lib)
add_subdirectory(gfx)
add_subdirectory(blitz3d)

add_library(${PROJECT_NAME} SHARED
	"bbruntime_dll.hpp"
	"bbruntime_dll.cpp"
	"resource.hpp"
	"bbruntime_dll.rc"
)

target_link_libraries(${PROJECT_NAME}
	config
	runtime_lib
	runtime_gfx
	runtime_blitz3d
	stdutil
	${fmod_LIBRARIES}
	${FreeImage_LIBRARIES}
	ddraw
	dsound
	dxguid
	mswsock
	shell32
	winmm
)

target_include_directories(${PROJECT_NAME}
	PUBLIC
		${PROJECT_SOURCE_DIR}
)

if(MSVC)
	target_compile_options(${PROJECT_NAME}
		PRIVATE /EHa
	)
endif()

if (WIN32)
	target_compile_definitions(${PROJECT_NAME}
		PRIVATE
			_CRT_SECURE_NO_WARNINGS
			# windows.h
			WIN32_LEAN_AND_MEAN
			NOGPICAPMASKS
			NOVIRTUALKEYCODES
			NOWINMESSAGES
			NOWINSTYLES
			NOSYSMETRICS
			NOMENUS
			NOICONS
			NOKEYSTATES
			NOSYSCOMMANDS
			NORASTEROPS
			NOSHOWWINDOW
			NOATOM
			NOCLIPBOARD
			NOCOLOR
			NOCTLMGR
			NODRAWTEXT
			#NOGDI
			NOKERNEL
			#NOUSER
			NONLS
			#NOMB
			NOMEMMGR
			NOMETAFILE
			NOMINMAX
			#NOMSG
			NOOPENFILE
			NOSCROLL
			NOSERVICE
			NOSOUND
			NOTEXTMETRIC
			NOWH
			NOWINOFFSETS
			NOCOMM
			NOKANJI
			NOHELP
			NOPROFILER
			NODEFERWINDOWPOS
			NOMCX
			NOIME
			NOMDI
			NOINOUT
	)
endif()

install(TARGETS ${PROJECT_NAME}
	DESTINATION lib
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
	OBJECTS DESTINATION lib
	RESOURCE DESTINATION lib
	PUBLIC_HEADER DESTINATION include
	PRIVATE_HEADER DESTINATION source
)
if(MSVC)
	install(
		FILES $<TARGET_PDB_FILE:${PROJECT_NAME}>
		DESTINATION bin
		OPTIONAL
	)
endif()

install(
	FILES ${fmod_BINARIES}
	DESTINATION bin
)
install(
	FILES ${FreeImage_BINARIES}
	DESTINATION bin
)
