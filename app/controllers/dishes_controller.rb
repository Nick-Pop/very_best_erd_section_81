class DishesController < ApplicationController
  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result(:distinct => true).includes(:favorites, :filters, :venues).page(params[:page]).per(10)

    render("dishes/index.html.erb")
  end

  def show
    @filter = Filter.new
    @favorite = Favorite.new
    @dish = Dish.find(params[:id])

    render("dishes/show.html.erb")
  end

  def new
    @dish = Dish.new

    render("dishes/new.html.erb")
  end

  def create
    @dish = Dish.new

    @dish.type_of_food = params[:type_of_food]
    @dish.restaurant_location = params[:restaurant_location]
    @dish.dish_details = params[:dish_details]
    @dish.cuisine_id = params[:cuisine_id]

    save_status = @dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes/new", "/create_dish"
        redirect_to("/dishes")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish created successfully.")
      end
    else
      render("dishes/new.html.erb")
    end
  end

  def edit
    @dish = Dish.find(params[:id])

    render("dishes/edit.html.erb")
  end

  def update
    @dish = Dish.find(params[:id])

    @dish.type_of_food = params[:type_of_food]
    @dish.restaurant_location = params[:restaurant_location]
    @dish.dish_details = params[:dish_details]
    @dish.cuisine_id = params[:cuisine_id]

    save_status = @dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/dishes/#{@dish.id}/edit", "/update_dish"
        redirect_to("/dishes/#{@dish.id}", :notice => "Dish updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Dish updated successfully.")
      end
    else
      render("dishes/edit.html.erb")
    end
  end

  def destroy
    @dish = Dish.find(params[:id])

    @dish.destroy

    if URI(request.referer).path == "/dishes/#{@dish.id}"
      redirect_to("/", :notice => "Dish deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Dish deleted.")
    end
  end
end
