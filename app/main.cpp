#include <iostream>
#include "my_lib.h"
#include "nlohmann/json.hpp"

int main()
{
    int i[2];
    // i[2] = 2;
    
    print_hello_world();
    print_project_info();
    std::cout << "Nlohmann Json Version:"
            << NLOHMANN_JSON_VERSION_MAJOR << "."
            << NLOHMANN_JSON_VERSION_MINOR << "."
            << NLOHMANN_JSON_VERSION_PATCH << "\n";

        return 0;
}