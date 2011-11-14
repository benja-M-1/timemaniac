$:.push File.expand_path('../../../lib', __FILE__)

require 'timemaniac'

Timemaniac.setup

class TaskSchema < Sequel::Migration
    def up
        create_table!(:tasks) do
            primary_key :id
            String   :key, :unique => true
            String   :name
            Text     :description
            Ineger   :status
            Datetime :started_at
            Datetime :finished_at
            Integer  :elapsed_time
            unique [:id, :name]
        end
    end

    def down
        drop_table(:task)
    end
end 
