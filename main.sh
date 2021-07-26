#!/bin/bash

# Intro
zenity --info --title="Fresh Install Tool" --text="Let's walk though what software you want on this installation. First we'll make sure your sources are up to date." --width=300 --height=100

## Fedora

if [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Fedora"* ]]; then
   echo "Fedora detected"

## Run the Fedora bash script

   lib/fedora.sh

## Ubuntu

elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Ubuntu"* ]]; then
   echo "Ubuntu detected"

## Run the Ubuntu bash script

   lib/ubuntu.sh

## Pop!_OS

elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Pop"* ]]; then
   echo "Pop!_OS detected"

## Run the Pop!_OS bash script

   lib/pop.sh

## Arch

   elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Arch Linux"* ]]; then
      echo "Arch detected"

## Run the Arch bash script

   lib/arch.sh

## Garuda

   elif [[ $(grep PRETTY /etc/os-release | cut -c 13-) = *"Garuda Linux"* ]]; then
      echo "Garuda detected"

## Run the Garuda bash script

   lib/garuda.sh

fi
