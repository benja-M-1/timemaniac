# Add to $LOAD_PATH timemaniac
$:.unshift File.dirname(__FILE__)

# Ruby requirements
require 'singleton'
require 'yaml'
require 'time'

# Internal requirements
require 'timemaniac/timer'
require 'timemaniac/entry'
require 'timemaniac/entries'

# Timemaniac classes
module Timemaniac
  VERSION = '0.0.1'
end
