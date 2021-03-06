class RegistrationsController < Devise::RegistrationsController
  before_action :one_user_registered?, only: %i[new create]

  protected

  def one_user_registered?
    redirect_to user_signed_in? ? root_path : new_user_session_path if User.count == 1
  end

end