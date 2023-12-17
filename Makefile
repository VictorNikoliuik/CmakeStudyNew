prepare:
	rm -rf build
	mkdir build
build:
	cd build
	cmake --build build/
dependency:
	cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o gpraphImg.png