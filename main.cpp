//this is a monospaced font

#include <iostream>
#include <deps.h>
#include <source1.h>

int main(int argc, char **argv)
{
	std::cout << "deps include: " << deps() << std::endl;
	std::cout << "source1 include: " << source1() << std::endl;
	std::cout << "int main returning 0 ..." << std::endl;
	return 0;
}
