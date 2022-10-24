class ManagersSessionsController < ApplicationController
    def create
      manager = Manager.find_by(email: params[:email])
              
      if manager &.authenticate(params[:password])
          session[:manager_id] = manager.id
          
          # render json: manager, status: :created
          app_response(message: "Log in success", body: manager)
      else
          app_response(status_code: 401, message: "Invalid username or password")
      end
    end
    
      def is_logged_in?
        if logged_in_manager? && current_manager
          render json: {
            logged_in: true,
            manager: current_manager
          }
        else
          render json: {
            logged_in: false,
            message: 'no such Manager'
          }
        end
      end
    
      def destroy
        delete_manager_session
        render json: {
            status: 200,
            logged_out: true
            # message: 'Log out successfully'
        }
      end
    
      private
      def session_params
        params.permit(:email, :password)
    end

      def delete_manager_session
        session.delete :manager_id
      end
end
