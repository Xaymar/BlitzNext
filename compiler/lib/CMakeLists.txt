project(compiler_lib)

set(PRIVATE_SOURCE
	"assem.hpp"
	"codegen.hpp"
	"decl.cpp"
	"decl.hpp"
	"declnode.cpp"
	"declnode.hpp"
	"environ.cpp"
	"environ.hpp"
	"ex.hpp"
	"exprnode.cpp"
	"exprnode.hpp"
	"label.hpp"
	"node.cpp"
	"node.hpp"
	"parser.cpp"
	"parser.hpp"
	"prognode.cpp"
	"prognode.hpp"
	"stmtnode.cpp"
	"stmtnode.hpp"
	"toker.cpp"
	"toker.hpp"
	"type.cpp"
	"type.hpp"
	"var.hpp"
	"varnode.cpp"
	"varnode.hpp"
	"assem_x86/assem_x86.hpp"
	"assem_x86/assem_x86.cpp"
	"assem_x86/operand.hpp"
	"assem_x86/operand.cpp"
	"assem_x86/insts.hpp"
	"assem_x86/insts.cpp"
	"codegen_x86/codegen_x86.hpp"
	"codegen_x86/codegen_x86.cpp"
	"codegen_x86/tile.hpp"
	"codegen_x86/tile.cpp"
)
set(PRIVATE_HEADER
	${PRIVATE_SOURCE}
)

list(FILTER PRIVATE_SOURCE EXCLUDE REGEX "^.*.hpp.*$")
list(FILTER PRIVATE_HEADER EXCLUDE REGEX "^.*.cpp.*$")

add_library(${PROJECT_NAME} STATIC
	${PRIVATE_SOURCE}
	${PRIVATE_HEADER}
)

source_group(TREE "${PROJECT_SOURCE_DIR}" PREFIX "Source Files" FILES ${PRIVATE_SOURCE})
source_group(TREE "${PROJECT_SOURCE_DIR}" PREFIX "Header Files" FILES ${PRIVATE_HEADER})

target_link_libraries(${PROJECT_NAME}
	config
	stdutil
	linker
)

target_include_directories(${PROJECT_NAME}
	PUBLIC
		${PROJECT_SOURCE_DIR}
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
			NOGDI
			NOKERNEL
			NOUSER
			NONLS
			NOMB
			NOMEMMGR
			NOMETAFILE
			NOMINMAX
			NOMSG
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
