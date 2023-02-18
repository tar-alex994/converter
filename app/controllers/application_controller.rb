class ApplicationController < ActionController::Base
    # before_action :add_log

    private
        def add_log
            Log.create(
                remote_ip:          request.remote_ip,
                request_id:         request.request_id,
                method:             request.method,
                path:               request.path,
                query_string:       request.query_string,
                request_parameters: request.request_parameters 
            )
        end
end
