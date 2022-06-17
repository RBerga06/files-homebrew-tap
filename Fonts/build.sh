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
    rm -rf "sha256.txt"
    rm -rf "*.zip"
}

function build {
    ### MesloLGS NF ###
    font "MesloLGS NF"
    ### LOTR ###
    font "LOTR"
    # Runes
    font "AngloSaxon Runes"
    font "Dwarf Runes"
    font "Germanic Runes"
}

clean
build
