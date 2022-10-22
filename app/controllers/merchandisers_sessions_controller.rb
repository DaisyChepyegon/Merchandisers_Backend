class MerchandisersSessionsController < ApplicationController
    def create
        merchandiser = Merchandiser.find_by(email: session_params_merchandiser[:email])
        if merchandiser&.authenticate(session_params_merchandiser[:password])
          session[:merchandiser_id] = merchandiser.id
          render json: {
            logged_in: true,
            merchandiser: merchandiser
          }
        else
          render json: { 
            status: 401,
            errors: ['no such Merchandiser', 'verify credentials and try again or signup']
          }
        end
      end
    
      def is_logged_in?
        if logged_in_merchandiser? && current_merchandiser
          render json: {
            logged_in: true,
            merchandiser: current_merchandiser
          }
        else
          render json: {
            logged_in: false,
            message: 'no such Merchandiser'
          }
        end
      end
    
      def destroy
        delete_merchandiser_session
        render json: {
            status: 200,
            logged_out: true
            message: 'Log out successfully'
        }
      end
    
      private
      def session_params_merchandiser
      params.require(:merchandiser).permit(:username, :email, :password)
 
      def delete_merchandiser_session
        session.delete :merchandiser_id
      end
  end
