module Timemaniac
  class Entry
    include DataMapper::Resource

    property :id,          Serial
    property :name,        String
    property :description, Text
    property :status,      Integer
    property :created_at,  DateTime
    property :started_at,  DateTime
    property :finished_at, DateTime

    attr_accessor :elapsed_time

    attr_accessor :timer

    def initialize(attributes={})
      super attributes
      @created_at = DateTime.now
      @timer = Timer.new
      @status = @timer.status
    end

    def start
      @timer.start
      @status = @timer.status
    end

    def stop
      @timer.stop
      @status = @timer.status
    end

    def to_s
      "#{@name} : #{@description} (#{@timer.to_s})"
    end

  end
end

Timemaniac::Entry.auto_upgrade!