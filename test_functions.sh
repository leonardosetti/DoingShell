#! /bin/bash

name='name_01'

echo $name

if [$name -eq 'name_01' ]; then
	echo 'correct if clause'
else
	echo 'find the solution'
fi

echo""

func_1
exit=0
