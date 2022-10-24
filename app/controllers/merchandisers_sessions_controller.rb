class MerchandisersSessionsController < ApplicationController
    def create
     merchandiser =Merchandiser.find_by(email: sessions_params[:email])
      if merchandiser &.authenticate(sessions_params[:password])
        create_merchandiser_session(merchandiser.id)
        app_response(message: "Log in success", body:merchandiser)
      else
          app_response(status_code: 401, message: "Invalid username or password")
      end
      end
    
     
      def destroy
        delete_merchandiser_session
        app_response(status_code: 200, message: "Log out successfully")
      end
    
      private
      def sessions_params
      params.require(:merchandiser).permit(:username, :email, :password)
 
      def delete_merchandiser_session
        session.delete :merchandiser_id
      end

      def create_merchandiser_session(merchandiser.id)
        session[:merchandiser_id] ||= merchandiser_id
      end
  end
