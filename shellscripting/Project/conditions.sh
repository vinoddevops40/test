#!/bin/bash
read -p 'Enter a value(number): ' val
if [$val -lt 10]; then
  echo "Value is less than 10"
else
  echo "Value is Greater than 10"
fi