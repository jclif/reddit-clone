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
    @sub = User.new(params[:sub])

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

end
