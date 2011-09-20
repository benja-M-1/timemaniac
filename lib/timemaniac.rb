# Add to $LOAD_PATH timemaniac
$:.unshift File.dirname(__FILE__)

# Ruby requirements
require 'singleton'
require 'yaml'

# Timemaniac classes
module Timemaniac
end

require 'timemaniac/timer'
require 'timemaniac/entry'
require 'timemaniac/entries'