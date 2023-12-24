#include "my_lib.h"
#include <iostream>

#include "my_lib.h"
#include "projectVersion.hpp"

void print_hello_world()
{
    std::cout << "Hello World\n";
}

void print_project_info()
{
    std::cout << "Project Name: " << project_name << '\n';
    std::cout << "Project Version: " << project_version << '\n';
}

uint32_t factorial(uint32_t number)
{
    return number <= 1 ? 1 : factorial(number - 1) * number;
}
