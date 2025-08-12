#!/bin/bash

echo "Node listing as of "`date` > nodes.txt

for i in *.lua; do
	echo -e "\nIn $i:\n" >> nodes.txt
	cat $i | grep "core.register_node(" | \
	sed "s/core.register_node(.decor:/decor:/; s/., {//" | \
	sort  >> nodes.txt
done

less nodes.txt
rm -f nodes.txt
