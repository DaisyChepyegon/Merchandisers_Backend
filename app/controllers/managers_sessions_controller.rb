class ManagersSessionsController < ApplicationController
    def create
        manager = Manager.find_by(email: session_params_manager[:email])
        if manager&.authenticate(session_params_manager[:password])
          session[:manager_id] = manager.id
          render json: {
            logged_in: true,
            manager: manager
          }
        else
          render json: { 
            status: 401,
            errors: ['no such Manager', 'verify credentials and try again or signup']
          }
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
            message: 'Log out successfully'
        }
      end
    
      private
      def session_params_manager
       params.require(:manager).permit(:username, :email, :password)
      end

      def delete_manager_session
        session.delete :manager_id
      end
end
