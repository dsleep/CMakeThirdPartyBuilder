set(CMAKE_DEBUG_POSTFIX "d" CACHE STRING "")	

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib" CACHE PATH "Archive output dir.")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib" CACHE PATH "Library output dir.")
set(CMAKE_PDB_OUTPUT_DIRECTORY     "${CMAKE_BINARY_DIR}/bin" CACHE PATH "PDB (MSVC debug symbol)output dir.")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin" CACHE PATH "Executable/dll output dir.")

set(BUILD_DOCUMENTATION OFF CACHE BOOL "")	
set(BUILD_EXAMPLES OFF CACHE BOOL "")	
set(BUILD_UNIT_TESTS OFF CACHE BOOL "")	
set(BUILD_TESTS OFF CACHE BOOL "")	
set(BUILD_WITH_RTTI OFF CACHE BOOL "")	

# if(MSVC)

	# set(USE_VS_MULTIPROCESS ON CACHE BOOL "Use MultiProcessor compiling on VS")
	
	# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /std:c++17" CACHE STRING "")
	
	# if(USE_VS_MULTIPROCESS)
		# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP" CACHE STRING "")
		# set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /MP" CACHE STRING "")
	# endif()
	
# else()
	
	# # set position independent
	# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17" CACHE STRING "")

# endif()