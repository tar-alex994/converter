class Admin::LogsController < Admin::AdminController
  include Pagination

  def from_controllers
    @logs = Log.order(:created_at).filter_form(filter_params)

    @page_size    = 6
    @last_page    = get_a_last_page(@logs.count)
    @current_page = get_a_current_page
    
    @logs = @logs.offset(get_an_offset).limit(@page_size)
  end

  def from_controllers_all
    @logs = Log.order(:created_at).filter_form(filter_params)
  end

  def from_file
    @logs = FileLogs.new("log/#{Rails.env}.log").filter_logs(params[:filter])

    @page_size    = 20
    @last_page    = get_a_last_page(@logs.size)
    @current_page = get_a_current_page

    @logs = @logs[get_an_offset, @page_size]
  end

  def from_file_all
    @logs = FileLogs.new("log/#{Rails.env}.log").filter_logs(params[:filter])
  end


  private
    def filter_params 
      attrs = [ :id, :ip, :get_parameters, :method, :request_id, :path, 
                :exact_path, :post_parameters ].map(&:to_s)

      params.select { |key, value| attrs.include?(key) and !(value.strip.empty?) }
    end
end
