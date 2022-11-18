cmake_minimum_required(VERSION 2.8.3)
project(dense_fusion_ros)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
)

catkin_package(CATKIN_DEPENDS)

catkin_package(
#  INCLUDE_DIRS include
 LIBRARIES dense_fusion_ros
 CATKIN_DEPENDS roscpp rospy
#  DEPENDS system_lib
)

include_directories(
  # include
  ${catkin_INCLUDE_DIRS}
  # ${PCL_INCLUDE_DIRS}
)

add_executable(test_node src/test_node.cpp)
add_dependencies(test_node ${${PROJECT_NAME}_EXPORTED_TARGETS}
  ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_node ${catkin_LIBRARIES})

# download and install sample data
# add_custom_target(${PROJECT_NAME}_install_sample_data
#   ALL COMMAND ${PROJECT_SOURCE_DIR}/scripts/install_sample_data.py)
