class Admin::LogsController < ApplicationController
    def from_controllers
        @logs = Log.all
    end

    def from_file
        @logs = File.readlines Rails.application.root + "log/production.log"
    end
end
