#!/bin/bash

read -p "Enter project folder name: " folder_name

# Enable autocomplete for file directories
read -e -p "Enter location (absolute path, default: $HOME): " location
location="${location:-$HOME}"

# Create the folder
folder_path="${location}/${folder_name}"
mkdir -p "${folder_path}"

# Copy the .devcontainer folder and its contents
devcontainer_src=$(realpath .devcontainer)
devcontainer_dest="${folder_path}/.devcontainer"
cp -r "${devcontainer_src}" "${devcontainer_dest}"

echo "Folder '${folder_name}' created at '${location}'."
