class ApplicationController < ActionController::API
  # include ActionController::Cookies
  
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def authorize_request
    header = request.headers['Authorization']
    header = header.split('').last if header
    begin
        @decoded = JsonWebToken.decode(header)
        @user = User.find(@decoded[:user_id])
        
    rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
        render json: {errors: e.message}, status: :unauthorized
    end
      
  end


private

def render_unprocessable_entity_response(exception)
  render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
end

def app_response(status_code: 200, message: "Success", body: nil, serializer: nil)
  if serializer
      render json: { 
          status: status_code, 
          message: message, 
          body: ActiveModelSerializers::SerializableResource.new(body, serializer: serializer) 
      },status: status_code
  else
      render json: { 
          status: status_code, 
          message: message, 
          body: body 
      },status: status_code
  end
end



end
