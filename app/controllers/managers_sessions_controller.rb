class ManagersSessionsController < ApplicationController
    def create
      manager = Manager.find_by(email: sessions_params[:email])
      if manager &.authenticate(sessions_params[:password])
        create_manager_session(manager_id)
        app_response(message: "Log in success", body: manager)
      else
          app_response(status_code: 401, message: "Invalid username or password")
      end
    end
    
    
    def destroy
        delete_manager_session
        app_response(status_code: 200, message: "Log out successfully")
      end
    
      private
      def create_manager_session(manager_id)
        session[:manager_id] ||= manager_id
      end

      def delete_manager_session
        session.delete :manager_id
      end
      def sessions_params
        params.require(:manager).permit(:username, :email, :password)
    end
end
