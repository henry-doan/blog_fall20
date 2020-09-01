class PagesController < ApplicationController
  
  # Read - all pages
  def index
    @pages = Page.all
    # render index.html.erb
  end

  # Read - show a single page
  def show
    @page = Page.find(params[:id])
    # render show.html.erb
  end

  # Read - show the new form, create in memory
  def new
    @page = Page.new
    # render new.html.erb
  end

  # Post Create, create the page in the database
  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  # Read - show the edit form 
  def edit
    @page = Page.find(params[:id])
    # render edit.html.erb
  end

  # Put update, updates the page in db
  def update
    @page = Page.find(params[:id])
    if @page.update(pages_params)
      redirect_to pages_path
    else
      render :edit
    end
  end

  # Delete delete the page in db
  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private 
    def pages_params
      params.require(:page).permit(:title, :author, :body)
    end
end
