#!/bin/bash

while read extension; do
	if [ "$extension" != "" ]; then
		code --install-extension $extension
	fi
done < ./autoinstall