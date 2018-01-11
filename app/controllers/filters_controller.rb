class FiltersController < ApplicationController
  def index
    @filters = Filter.all

    render("filters/index.html.erb")
  end

  def show
    @filter = Filter.find(params[:id])

    render("filters/show.html.erb")
  end

  def new
    @filter = Filter.new

    render("filters/new.html.erb")
  end

  def create
    @filter = Filter.new

    @filter.dish_id = params[:dish_id]
    @filter.cuisine_id = params[:cuisine_id]

    save_status = @filter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/filters/new", "/create_filter"
        redirect_to("/filters")
      else
        redirect_back(:fallback_location => "/", :notice => "Filter created successfully.")
      end
    else
      render("filters/new.html.erb")
    end
  end

  def edit
    @filter = Filter.find(params[:id])

    render("filters/edit.html.erb")
  end

  def update
    @filter = Filter.find(params[:id])

    @filter.dish_id = params[:dish_id]
    @filter.cuisine_id = params[:cuisine_id]

    save_status = @filter.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/filters/#{@filter.id}/edit", "/update_filter"
        redirect_to("/filters/#{@filter.id}", :notice => "Filter updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Filter updated successfully.")
      end
    else
      render("filters/edit.html.erb")
    end
  end

  def destroy
    @filter = Filter.find(params[:id])

    @filter.destroy

    if URI(request.referer).path == "/filters/#{@filter.id}"
      redirect_to("/", :notice => "Filter deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Filter deleted.")
    end
  end
end
