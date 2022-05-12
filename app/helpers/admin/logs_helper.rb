module Admin::LogsHelper
    def filter_params
        params.permit(
          :id,
          :ip, 
          :get_parameters, 
          :method, 
          :request_id, 
          :path, 
          :post_parameters,
          :exact_match,
          :commit
        )
    end
end
