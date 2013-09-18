class LinksController < ApplicationController
  # TODO ensure user is logged in before linking

  def show
    @link = Link.find(params[:id])
  end

  def new
    unless current_user
      flash[:errors] = ["You gotta sign in to link, brah!"]
      redirect_to new_session_url
    else
      @link = Link.new
    end
  end

  def create
    # TODO use url_with_protocol to ensure that protocol is present
    @link = Link.new(params[:link])

    if @link.save!
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to new_link_url
    end
  end

  # TODO !!! finish links controller and views !!!

end
