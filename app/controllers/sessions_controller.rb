class SessionsController < ApplicationController

  def new
    @parent = Parent.find_by(params[:email])
  end

  def create
    @parent = Parent.find_by(:email => params[:email])
    if @parent && @parent.authenticate(params[:password])
      session[:parent_id] = @parent.id
      redirect_to todos_path(@parent)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end
end
