#!/bin/sh

# This script was created with the aim of helping me create and fill out the repetitive parts of Class.cpp/.hpp files faster.

if [ "$#" -eq 0 ]
then
	echo "\033[1;30m\033[107mUsage:\033[0;39m\033[49m ./newClass.sh <ClassName>"
	exit 0
fi

# $1 = ClassName

# Create header file
cat << EOF > $PWD/$1.hpp
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   $1.hpp                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mortins- <mortins-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: `date +"%Y-%m-%d %T"` by mortins-          #+#    #+#             */
/*   Updated: `date +"%Y-%m-%d %T"` by mortins-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef $(echo "$1"_HPP | tr '[:lower:]' '[:upper:]')
# define $(echo "$1"_HPP | tr '[:lower:]' '[:upper:]')

# include <iostream>

class $1 {
	private:

	public:
		$1( void );
		~$1( void );
};

#endif
EOF

# Create C++ file
cat << EOF > $PWD/$1.cpp
/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   $1.cpp                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mortins- <mortins-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: `date +"%Y-%m-%d %T"` by mortins-          #+#    #+#             */
/*   Updated: `date +"%Y-%m-%d %T"` by mortins-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "$1.hpp"

$1::$1( void ) {
	//std::cout << "$1 has been constructed" <<std::endl;
}

$1::~$1( void ) {
	//std::cout << "$1 has been destroyed" <<std::endl;
}
EOF