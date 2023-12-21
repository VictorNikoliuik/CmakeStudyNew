prepare:
	rm -rf build
	mkdir build
build:
	cd build
	cmake --build build/
dependency:
	cd build && cmake .. --graphviz=graph.dot && dot -Tpng graph.dot -o gpraphImg.png

conan_d:
	rm -rf build
	mkdir build
	cd build && conan install .. -s build_type=Debug -s compiler.cppstd=17 --output-folder=. --build missing

conan_r:
	rm -rf build
	mkdir build
	cd build && conan install .. -s build_type=Release -s compiler.cppstd=17 --output-folder=. --build missing
