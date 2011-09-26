module Timemaniac
  class Entry
    include DataMapper::Resource

    property :id,          Serial
    property :name,        String
    property :description, Text
    property :created_at,  DateTime

    # Timer
    attr_reader :timer

    def initialize(attributes={})
      super attributes
      @timer = Timemaniac::Timer.new
    end

    def start
      @timer.start
    end

    def stop
      @timer.stop
    end

    def to_s
      "#{@name} : #{@description}"
    end
  end
end

Timemaniac::Entry.auto_upgrade!