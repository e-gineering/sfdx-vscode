#!/bin/bash

function dx-open() {
    if [ $# -ne 1 ]
    then
        sfdx open org
    else
        sfdx open org --target-org="$1"
    fi
}

function dx-list() {
    sfdx org list
}

function dx-details() {
    if [ $# -ne 1 ]
    then
        sfdx org display
    else
        sfdx org display --target-org="$1"
    fi
}

function dx-clean() {
    tools_dir=$(find /workspaces -type d -path "*sfdx/tools")

    if [ -z "$tools_dir" ]
    then
        echo "Unable to find tools directory"
    else
        while IFS= read -r line ; do "rm $line/debug/logs/*.log; rm $line/testresults/apex/*.json"; done <<< "$tools_dir"
    fi
}

function dx-test() {
    sfdx apex run test -l RunLocalTests | grep -o '".*"' | sed 's/"//g' | sh
}