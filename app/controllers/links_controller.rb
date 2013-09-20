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
    params[:link][:url] = url_with_protocol(params[:link][:url])
    @link = Link.new(params[:link])

    if @link.save!
      redirect_to link_url(@link)
    else
      flash[:errors] = @link.errors.full_messages
      redirect_to new_link_url
    end
  end

  def edit
    @link = Link.find(params[:id])
    @linksubs_string = @link.subs.map!{ |sub| sub.name }.join(" ")
    fail
  end

  def update
    @sub = Sub.find_by_id(params[:link][:url])

    unless @sub
      flash[:errors] = ["Subreddit doesn't exist"]
      render :edit
    else
      @link = Link.find(params[:id])

      if @link.update_attributes(params[:link])
        redirect_to sub_url(@sub)
      else
        flash[:errors] = @sub.errors.full_messages
        render :edit
      end
    end
  end
end
