class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    # Login
    if params[:provider] && params[:access_token_hash]
      login_or_create_from_client_side(params[:provider], params[:access_token_hash])
    elsif params[:email] && params[:password]
      login(params[:email], params[:password])
    end

    # Response
    if @api_access_token
      render :json => {:access_token => @api_access_token.token }
    else
      head :unauthorized
    end
  end

  def destroy
    logout
    head :ok
  end
end
