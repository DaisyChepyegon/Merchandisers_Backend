class ManagersSessionsController < ApplicationController

  def login
    @user = Manager.find_by_email(params[:email]) ||  Merchandiser.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
          token = JsonWebToken.encode(user_id: @user.id)
          time = Time.now + 24.hours.to_i
          render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                  email: @user.email}, status: :ok
    else
      render json: { error: 'Username or password invalid' }, status: :unauthorized
    end
  end

private

def login_params
  params.permit(:email, :password)
end

end

   