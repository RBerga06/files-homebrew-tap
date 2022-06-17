#!/bin/bash

function zip {
    ditto -c -k --sequesterRsrc "$1" "$2";
}

function font {
    echo "Bundling font: $1"
    zip "$1" "$1.zip"
    sha256sum "$1.zip" >> "sha256.txt"
}

function clean {
    echo "Cleaning"
    if [ "$1" ]; then
        rm -rf "$1.zip"
    else
        rm -rf "sha256.txt"
        rm -rf "*.zip"
    fi
}

function build {
    ### MesloLGS NF ###
    font "MesloLGS NF"
    ### LOTR ###
    font "LOTR"
    # Movies
    font "Ringbearer"
    # Runes
    font "AngloSaxon Runes"
    font "Dwarf Runes"
    font "Germanic Runes"
}

if [ "$1" ]; then
    clean "$1"
    font "$1"
else
    clean
    build
fi
