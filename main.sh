#!/bin/bash

# Intro
zenity --info --title="Fresh Install Tool" --text="Let's walk though what software you want on this installation. First we'll make sure your sources are up to date." --width=300 --height=100

## Fedora

if [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Fedora"* ]]; then
   echo "Fedora detected"

   lib/fedora.sh

## Ubuntu

elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Ubuntu"* ]]; then
   echo "Ubuntu detected"

   lib/ubuntu.sh

## Pop!_OS

elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Pop"* ]]; then
   echo "Pop!_OS detected"

   lib/pop.sh

## Arch

   elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Arch Linux"* ]]; then
      echo "Arch detected"

   lib/arch.sh

## Garuda

   elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Garuda Linux"* ]]; then
      echo "Garuda detected"

   lib/garuda.sh

fi
