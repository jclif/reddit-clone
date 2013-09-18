class SubsController < ApplicationController

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
    # TODO finish links and have: 3.times { @sub.links.build }
  end

  def create
    user_id = User.find_by_user_name(params[:sub][:user_name]).id
    @sub = Sub.new(name: params[:sub][:name], user_id: user_id)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    # TODO kill it with fire...figure out more elegant way to handle bad input
    if params[:sub][:name] == "" || params[:sub][:user_name] == ""
      flash[:errors] = ["You're fillin out the form wrong, brah!"]
      redirect_to edit_sub_url(Sub.find(params[:id]))
    elsif User.find_by_user_name(params[:sub][:user_name]).nil?
      flash[:errors] = ["That user doesn't exist!"]
      redirect_to edit_sub_url(Sub.find(params[:id]))
    else
      user_id = User.find_by_user_name(params[:sub][:user_name]).id
      @sub = Sub.find(user_id)
      if @sub.update_attributes(name: params[:sub][:name], user_id: user_id)
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    end
  end

  def destroy
    Sub.delete(params[:id])
    redirect_to subs_url
  end

end
