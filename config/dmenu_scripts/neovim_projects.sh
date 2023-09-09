#!/bin/bash

# Define the path to your Projects directory
projects_dir="$HOME/Projects"

# Use find to list all directories under ~/Projects
project_list=$(find "$projects_dir" -maxdepth 1 -type d -exec basename {} \; | grep -v "$(basename "$projects_dir")" | dmenu -l 5 -p  "Select a project:" -nb '#16161e' -sf '#16161e' -sb '#79a0f5' -nf '#79a0f5')

# Check if the user selected a folder
if [ -n "$project_list" ]; then
    # Construct the full path to the selected folder
    selected_folder="$projects_dir/$project_list"
    
    # Change the working directory to the selected folder
    cd "$selected_folder"
    
    # Open Neovim in the selected folder
    alacritty -e nvim
fi

