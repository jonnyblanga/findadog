class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.all
  end

  def show
    @dog
  end

  def new
    @dog = Dog.new
  end

  def create
    color_string = params[:dog][:color]
    if color_string.include? " "
      color = color_string.split(" ")
    else
      color = [color_string]
    end
    params_update = dog_params
    params_update[:color] = color
    @dog = Dog.new(params_update)
    @dog.user = current_user
    if @dog.save!
      redirect_to dog_path(@dog)
    else
      render :new
    end
  end

  def edit
    @dog
  end

  def update
    color_string = params[:dog][:color]
    if color_string.include? " "
      color = color_string.split(" ")
    else
      color = [color_string]
    end
    params_update = dog_params
    params_update[:color] = color

    if @dog.update(params_update)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :gender, :date_of_birth, :size, :breed, :color, :is_hypoallergenic, :is_sterilized, :pictures, :photo)
  end

  def find_dog
    @dog = Dog.find(params[:id])
  end
end
