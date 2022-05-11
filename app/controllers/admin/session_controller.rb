class Admin::SessionController < Admin::AdminController
  skip_before_action :authenticate_admin, only: [:index, :create]

  def index
  end

  def create
    admin    = Rails.application.credentials.admin.login
    password = Rails.application.credentials.admin.password

    if params[:login] == admin and params[:password] == password
      session[:admin] = true

      SendEmailJob.perform_later(request.remote_ip)

      redirect_to admin_root_path
    else
      @login            = params[:login]
      flash.now[:error] = 'Неверный логин или пароль.'
      
      render :index
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to admin_session_path
  end
end
