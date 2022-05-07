class Admin::LogsController < ApplicationController
    def from_controllers
        @logs = Log.all
    end
end
