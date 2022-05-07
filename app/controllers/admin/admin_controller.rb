class Admin::AdminController < ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
        unless session[:admin]
            flash[:error] = "Вы должны войти, чтобы получить доступ"
            redirect_to admin_session_path
        end
    end
end