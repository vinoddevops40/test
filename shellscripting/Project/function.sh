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
  echo input arg is $1
}

iarg pass