#!/bin/bash

function dx-clean() {
	tools_dir=$(find /workspaces -type d -path "*sfdx/tools")

	if [ -z "$tools_dir" ]
	then
		echo "Unable to find tools directory"
	else
		while IFS= read -r line
		do
			rm -f "$line"/debug/logs/*.log
			rm -f "$line"/testresults/apex/*.json
		done <<< "$tools_dir"
	fi
}

function dx-details() {
	if [ $# -ne 1 ]
	then
		sf org display
	else
		sf org display --target-org="$1"
	fi
}

function dx-list() {
	sf org list
}

function dx-open() {
	if [ $# -ne 1 ]
	then
		sf open org
	else
		sf open org --target-org="$1"
	fi
}

function dx-test() {
	sf apex run test -l RunLocalTests | grep -o '".*"' | sed 's/"//g' | sh
}