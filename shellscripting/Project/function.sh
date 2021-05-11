#!/bin/bash
function abc(){

  echo "executing the function abc"

}
function xyz(){

  echo "executing the function xyz"

}

abc
xyz

function iarg(){
  echo "input arg is $1"
}

iarg pass

A(){
  echo value a = $a
}

a=10
A

B(){
  b =10
}
B
echo value of b is $b
