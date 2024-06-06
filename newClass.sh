#!/bin/sh

# This script was created with the aim of helping me create and fill out the repetitive parts of Class.cpp/.hpp files faster.

if [ "$#" != "1" ]
then
	echo "\033[1;30m\033[107mUsage:\033[0;39m\033[49m ./newClass.sh <ClassName>"
	exit 0
fi

# $1 = ClassName

# Create header file
[ ! -d "$PWD/inc" ] && mkdir inc
cat << EOF > $PWD/inc/$1.hpp
#ifndef $(echo "$1"_HPP | tr '[:lower:]' '[:upper:]')
# define $(echo "$1"_HPP | tr '[:lower:]' '[:upper:]')

# include <iostream>

# define BOLD "\e[1m"
# define ITALIC "\e[3m"
# define UNDERLINE "\e[4m"
# define RED "\e[91m"
# define GREEN "\e[92m"
# define YELLOW "\e[93m"
# define BLUE "\e[94m"
# define PURPLE "\e[95m"
# define CYAN "\e[96m"
# define INVERT "\e[90m\e[107m"
# define RESET "\e[0m"

class $1 {
	private:

	public:
		// Constructors
		$1( void );
		$1( const $1 &$(echo $1 | tr '[:upper:]' '[:lower:]') );

		// Destructor
		~$1( void );

		// Copy assignment operator overload
		$1 & operator = ( const $1 &$(echo $1 | tr '[:upper:]' '[:lower:]') );

		// Getters

		// Setters

		// Methods
};

#endif
EOF

# Create C++ file
[ ! -d "$PWD/src" ] && mkdir src
cat << EOF > $PWD/src/$1.cpp
#include "../inc/$1.hpp"

// Default constructor
$1::$1( void ) {
	std::cout << "$1 default constructor called" <<std::endl;
}

// Copy constructor
$1::$1( const $1 &$(echo $1 | tr '[:upper:]' '[:lower:]') ) {
	std::cout << "$1 copy constructor called" << std::endl;
	*this = $(echo $1 | tr '[:upper:]' '[:lower:]');
}

// Destructor
$1::~$1( void ) {
	std::cout << "$1 destructor called" <<std::endl;
}

// Copy assignment operator overload
$1& $1::operator = ( const $1 &$(echo $1 | tr '[:upper:]' '[:lower:]') ) {
	std::cout << "$1 copy assignment operator called" << std::endl;
	if (this != &$(echo $1 | tr '[:upper:]' '[:lower:]')) {
		// this->setValue($(echo $1 | tr '[:upper:]' '[:lower:]').getValue());
	}
	return (*this);
}

// -----------------------------------Getters-----------------------------------

// -----------------------------------Setters-----------------------------------

// -----------------------------------Methods-----------------------------------
EOF
