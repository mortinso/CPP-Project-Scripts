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

class $1 {
	private:

	public:
		// Constructors
		$1( void );
		$1( const $1 &_$(echo $1 | tr '[:upper:]' '[:lower:]') );

		// Destructor
		~$1( void );

		// Operator overloads
		$1 &operator = ( const $1 &_$(echo $1 | tr '[:upper:]' '[:lower:]') );

		// Getters

		// Setters

		// Methods

		// Exceptions
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
$1::$1( const $1 &_$(echo $1 | tr '[:upper:]' '[:lower:]') ) {
	std::cout << "$1 copy constructor called" << std::endl;
	*this = _$(echo $1 | tr '[:upper:]' '[:lower:]');
}

// Destructor
$1::~$1( void ) {
	std::cout << "$1 destructor called" <<std::endl;
}

// -----------------------------------Operators---------------------------------
// Copy assignment operator overload
$1& $1::operator = ( const $1 &_$(echo $1 | tr '[:upper:]' '[:lower:]') ) {
	std::cout << "$1 copy assignment operator called" << std::endl;
	if (this != &_$(echo $1 | tr '[:upper:]' '[:lower:]')) {
		// this->setValue(_$(echo $1 | tr '[:upper:]' '[:lower:]').getValue());
	}
	return (*this);
}

// -----------------------------------Getters-----------------------------------

// -----------------------------------Setters-----------------------------------

// -----------------------------------Methods-----------------------------------

// -----------------------------------Exceptions--------------------------------
EOF
