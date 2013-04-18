class ApplicationController < ActionController::API
  before_filter :require_login
end
