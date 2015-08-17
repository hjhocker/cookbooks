#!/bin/bash

sudo chef-solo -o 'role[harrison]' -c solo.rb
