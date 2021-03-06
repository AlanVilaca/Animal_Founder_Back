class ApplicationController < ActionController::API
  def current_user
    header = request.headers["Authorization"]
    header = header.split(" ").last if header.present?

    return nil unless header.present?
    @decoded = JsonWebToken.decode(header)
    return nil unless @decoded
    
    user = User.find_by(id: @decoded[0]['user_id'])
    return user
  end

  rescue_from CanCan::AccessDenied do |exception|
    render json: {message: "Permissao Negada, você não tem permissão a esse acesso"}, status: 403
  end
end
