class Admin::LogsController < Admin::AdminController
  def from_controllers
      @logs = Log.all
  end

  def from_file
    @current_page = current_page || 1
    @logs         = File.readlines Rails.application.root + "log/production.log"
    page_size     = 20
    @last_page    = @logs.size / page_size + (@logs.size % page_size == 0 ? 0 : 1)

    begin_log = (@current_page - 1) * page_size

    if @current_page == 0
      begin_log     = 0
      @current_page = 1
    elsif begin_log > @logs.size
      begin_log     = @logs.size - (@logs.size % page_size)
      @current_page = @last_page
    end
      
    @logs = @logs[begin_log, page_size]
  end

  private
    def current_page
      params[:current_page]&.match(/\A\d+/)&.to_s&.to_i
    end
end
