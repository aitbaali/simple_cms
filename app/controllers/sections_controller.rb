class SectionsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  before_action :find_section

  def index
    #@sections = Section.where(:page_id => @page.id).sorted
    @sections = @page.sections.sorted
  end

  def new
    @section = Section.new({:page_id => @page.id, :name => 'Default section', :visible => 'false'})
    #@pages = Page.sorted
    @pages = @page.subject.pages.sorted
    @section_count = Section.count + 1
  end

  def create
    @section = Section.create(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @pages = Page.sorted
      @section_count = Section.count + 1
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.sorted
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :page_id => @page.id, :id => @section.id)
    else
      @pages = Page.sorted
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}'deleted successfully."
    redirect_to(:action => 'index', :page_id => @page.id)
  end


  private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end

    def find_section
      if params[:page_id]
        @page = Page.find(params[:page_id])
      end
    end

end
