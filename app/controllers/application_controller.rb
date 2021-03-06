class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
# FIXME: using this to be able to move forward with cross script

  # Remove the root element, curly braces surrounding the JSON.
  def default_serializer_options
    {
      root: false
    }
  end

  # protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :json_request?
  force_ssl if: :ssl_configured?

  protected

  def ssl_configured?
    !Rails.env.development?
  end

  def json_request?
    # use if more than json returned
    # request.format.json?
    request.format = :json
  end

end
