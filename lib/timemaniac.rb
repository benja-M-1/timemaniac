# Add to $LOAD_PATH timemaniac
$:.unshift File.dirname(__FILE__)

# Ruby requirements
require 'singleton'
require 'yaml'
require 'time'

# Internal requirements
require 'timemaniac/entry'

# Timemaniac classes
module Timemaniac
  VERSION = '0.0.1'
end
