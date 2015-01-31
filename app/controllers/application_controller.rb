class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def add
    # TODO: consider how to handle non-integer inputs
    @result = params[:op1].to_i + params[:op2].to_i
    render inline: "<h1><%= @result %></h1>"
  end

  def multiply
    # TODO: consider how to handle non-integer inputs
    @result = params[:op1].to_i * params[:op2].to_i
    render inline: "<h1><%= @result %></h1>"
  end

  def bad_request
    render :nothing => true, :status => 400
  end

end
