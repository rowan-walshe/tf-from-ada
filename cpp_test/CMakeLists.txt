cmake_minimum_required(VERSION 3.16)

project(tensorflow_v2_cpp)

find_package(CUDA REQUIRED)

# We installed Tensorflow in /opt/tensorflow - change if you installed elsewhere
set(TENSORFLOW_LIB_DIR "/opt/tensorflow/lib") 
set(SOURCES ai.cpp)
set(HEADER_FILES ai.h)

add_executable(main main.cpp ${SOURCES} ${HEADER_FILES})
target_include_directories(main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_include_directories(main PRIVATE ${TENSORFLOW_LIB_DIR}/include)
target_link_libraries(main ${TENSORFLOW_LIB_DIR}/libtensorflow.so)
target_link_libraries(main ${TENSORFLOW_LIB_DIR}/libtensorflow_framework.so)
target_compile_features(main PRIVATE cxx_std_17)

include_directories(${Protobuf_INCLUDE_DIRS})