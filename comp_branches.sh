#!/bin/bash

if ! diff -q branches_list branches_latest; 
               then 
                 #THINGS HAVE CHANGED
                 mv branches_latest branches_list
                 exit 1
	             else
                 #THINGS DID NOT CHANGE
                 exit 0
                 
fi
