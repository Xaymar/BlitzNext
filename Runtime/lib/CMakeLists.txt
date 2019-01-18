project(runtime_lib)

add_library(${PROJECT_NAME} STATIC
	"basic.cpp"
	"basic.hpp"
	"bb_basic.hpp"
	"bbaudio.cpp"
	"bbaudio.hpp"
	"bbbank.cpp"
	"bbbank.hpp"
	"bbblitz3d.cpp"
	"bbblitz3d.hpp"
	"bbfilesystem.cpp"
	"bbfilesystem.hpp"
	"bbgraphics.cpp"
	"bbgraphics.hpp"
	"bbinput.cpp"
	"bbinput.hpp"
	"bbmath.cpp"
	"bbmath.hpp"
	"bbruntime.cpp"
	"bbruntime.hpp"
	"bbsockets.cpp"
	"bbsockets.hpp"
	"bbstream.cpp"
	"bbstream.hpp"
	"bbstring.cpp"
	"bbstring.hpp"
	"bbsys.cpp"
	"bbsys.hpp"
#	"multiplay.cpp"
#	"multiplay.hpp"
#	"multiplay_setup.cpp"
#	"multiplay_setup.hpp"
#	"multiplay_setup.rc"
	"resource.hpp"
#	"userlib.cpp"
#	"userlib.hpp"
	"userlibs.cpp"
	"userlibs.hpp"
)

target_link_libraries(${PROJECT_NAME}
	stdutil
	runtime_gfx
	ddraw
	dsound
	dxguid
	wsock32
)

target_include_directories(${PROJECT_NAME}
	PUBLIC ${PROJECT_SOURCE_DIR}
)


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
			NOMB
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
