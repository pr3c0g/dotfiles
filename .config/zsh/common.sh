#!/usr/bin/env bash

# Output prettyfying
color_red="\e[31m"
color_green="\e[32m"
color_yellow="\e[33m"
color_blue="\e[34m"
color_bold="\e[1m"
color_reset="\e[0m"

print_error() { printf "%b%b%b%b" "$color_red" "$color_bold" "$1" "$color_reset"; }
print_warning() { printf "%b%b%b%b" "$color_yellow" "$color_bold" "$1" "$color_reset"; }
print_success() { printf "%b%b%b%b" "$color_green" "$color_bold" "$1" "$color_reset"; }
print_soft_success() { printf "%b%b%b" "$color_green" "$1" "$color_reset"; }
print_info() { printf "%b%b%b" "$color_blue" "$1" "$color_reset"; }
print_bold_info() { printf "%b%b%b%b" "$color_blue" "$color_bold" "$1" "$color_reset"; }
