class UsersController < ApplicationController
  def login_merch
    @user = Merchandiser.find_by_email(user_params[:email])

    if @user && @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token, role: 'merch'}, status: :ok
    else
        render json: {error:"Invalid Email or password"}, status: :unprocessable_entity  
    end    
end

def login_manager
    @user = Manager.find_by_email(user_params[:email]) 

    if @user && @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token, role: 'manager'}, status: :ok
    else
        render json: {error:"Invalid Email or password"}, status: :unprocessable_entity  
    end    
end

def update
    @user = Merchandiser.find_by_email(user_params[:email]) || Manager.find_by_email(user_params[:email]) 

    if @user && @user.update!(user_params)
        render json: @user, status: :ok
    else
        render json: {error:"Account not found! try creating new one"}, status: :not_found
    end    
end


def destroy
    decode_token = decode_token()
    if decode_token
        user_id = decode_token[0]['user_id']
        puts user_id
        @user = Merchandiser.find_by_id(user_id) ||  Manager.find_by_id(user_id) 
    end
   render json: @user
end    

private

def user_params
    params.permit(:email, :password)
end

end
