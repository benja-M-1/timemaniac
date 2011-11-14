require "digest/sha1"

# @author Benjamin Grandfond <benjamin.grandfond@gmail.com>
module Timemaniac
    module Model
        class Task < Sequel::Model
            set_primary_key [:id, :name]

            attr_accessor :id
            attr_accessor :key
            attr_accessor :name
            attr_accessor :description

            attr_reader   :status
            attr_reader   :started_at
            attr_reader   :finished_at
            attr_reader   :elapsed_time

            def initialize(name, description = nil)
                @name = name
                @description = description
                @key = Digest::SHA1.hexdigest(@name + Time.now.to_s)
                @status = :unstarted
                @elapsed_time = 0
            end

            # Starts the task.
            # Set the status to started and set the started_at date.
            # @return void
            def start
                if @status != :stopped or @status != :running
                    @started_at = Time.now
                    @status = :running
                end
            end

            # Pauses the task.
            # It calculates the elapsed time between the begining and the end.
            # @return void
            def pause
                if @status == :running
                    @finished_at = Time.now
                    calculate_elapsed_time
                    @status = :paused
                end
            end

            # Stops the task.
            # Set the status to stopped. he task can't be started again.
            # @return void
            def stop
                unless @status == :stopped
                    @finished_at = Time.now
                    calculate_elapsed_time
                    @status = :stopped
                end
            end

            private

            # Computes elapsed time between the last start date and finished date
            # @return integer
            def calculate_elapsed_time
                raise Exception, "Can't calculate elapsed time" if @started_at.nil?
                @elapsed_time += @finished_at.to_i - @started_at.to_i 
            end
        end
    end
end
