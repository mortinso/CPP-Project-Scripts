#!/bin/sh

# This script was created with the aim of helping me create and fill out the repetitive parts of Class.cpp/.hpp files faster.

if [ "$#" -eq 0 ]
then
	echo "\033[1;30m\033[107mUsage:\033[0;39m\033[49m ./newClass.sh <ClassName>"
	exit 0
fi

ClassName = $1

# Create header file
cat << EOF > $PWD/$ClassName.hpp
#ifndef $(echo "$ClassName"_HPP | tr '[:lower:]' '[:upper:]')
# define $(echo "$ClassName"_HPP | tr '[:lower:]' '[:upper:]')

# include <iostream>

class $ClassName {
	private:

	public:
 		// Constructors
		$ClassName( void );

  		// Destructors
		~$ClassName( void );

  		// Methods
};

#endif
EOF

# Create C++ file
cat << EOF > $PWD/$ClassName.cpp
#include "$ClassName.hpp"

$ClassName::$ClassName( void ) {
	//std::cout << "$ClassName has been constructed" <<std::endl;
}

$ClassName::~$ClassName( void ) {
	//std::cout << "$ClassName has been destroyed" <<std::endl;
}
EOF
