# Copyright (c) David Sleeper (Sleeping Robot LLC)

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
# to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
# DEALINGS IN THE SOFTWARE.

cmake_minimum_required(VERSION 3.5)
project(ThirdParty_API VERSION 1.0.0 LANGUAGES CXX C)

LIST(APPEND CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

message( STATUS "BUILD SYSTEM: ${CMAKE_SYSTEM}" )
message( STATUS "BUILD SYSTEM NAME: ${CMAKE_SYSTEM_NAME}" ) 
message( STATUS "BUILD SYSTEM PROCESSOR: ${CMAKE_SYSTEM_PROCESSOR}" )

if(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
	set(OS_MAC ON)
	message(STATUS "MACOS FOUND")	
	add_definitions(-DPLATFORM_MAC=1)
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
	set(OS_LINUX ON)
	message(STATUS "LINUX FOUND")
	add_definitions(-DPLATFORM_LINUX=1)
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Windows")
    set(OS_WINDOWS ON)
	message(STATUS "WINDOWS FOUND")
	add_definitions(-DPLATFORM_WINDOWS=1)
else()
	message(FATAL_ERROR "We do not know OS!!!")
endif()

set(THIRD_PARTY_ROOT "${CMAKE_CURRENT_SOURCE_DIR}")

message(STATUS "Root: ${THIRD_PARTY_ROOT}")
include(ExternalProject)

function(ExternGitProject ProjectName GitPath)
    
	ExternalProject_Add(${ProjectName}

		GIT_REPOSITORY "${GitPath}"
		#GIT_TAG master
		SOURCE_DIR "${CMAKE_BINARY_DIR}/${ProjectName}/SRC"
		BINARY_DIR "${CMAKE_BINARY_DIR}/${ProjectName}/CMAKEBUILD"
		INSTALL_DIR "${THIRD_PARTY_ROOT}/${ProjectName}"
		 
		CMAKE_ARGS
			-DCMAKE_INSTALL_PREFIX:PATH=${THIRD_PARTY_ROOT}/${ProjectName}
			-C "${THIRD_PARTY_ROOT}/CMakeCachePreload.cmake"
				  
		#CONFIGURE_COMMAND ""
		#BUILD_COMMAND ""
		#INSTALL_COMMAND ""
		#TEST_COMMAND ""
		#LOG_DOWNLOAD        ON
		#LOG_UPDATE          ON
		#LOG_CONFIGURE       ON
		#LOG_BUILD           ON
		#LOG_TEST            ON
		#LOG_INSTALL         ON
	)

endfunction()

ExternGitProject(jsoncpp "https://github.com/dsleep/jsoncpp")
ExternGitProject(libjuice "https://github.com/dsleep/libjuice")
ExternGitProject(eigen "https://github.com/dsleep/eigen-git-mirror")
ExternGitProject(rttr "https://github.com/dsleep/rttr")
ExternGitProject(wxWidgets "https://github.com/dsleep/wxWidgets")

#ExternGitProject(cryptopp "https://github.com/dsleep/cryptopp") solution