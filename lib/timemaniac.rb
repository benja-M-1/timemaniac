# Add to $LOAD_PATH timemaniac
$:.unshift File.dirname(__FILE__)

# Rubygems
require 'rubygems'
require 'ruby-debug'
require 'cmdparse'

# Ruby requirements
require 'singleton'
require 'yaml' 

# Timemaniac classes
require 'timemaniac/timer'
require 'timemaniac/entry'
require 'timemaniac/entries'
