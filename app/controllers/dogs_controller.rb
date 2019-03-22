class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]

  def index
    @search = params[:search]
    if @search.present?
      @users = User.near(@search, 500)
    else
      @users = User.all
    end

    @dogs = Dog

    @dogs = @dogs.where(user_id: @users.map { |user| user.id })

    @size = params[:size_query]
    @gender = params[:gender_query]
    colors = params[:colors] || Dog::COLORS
    @hypoallergenic = params[:hypoallergenic_query] == "yes" ? true : false
    @sterilized = params[:sterilized_query] == "yes" ? true : false


    @dogs = @dogs.where(size: @size) if @size.present?
    @dogs = @dogs.where(gender: @gender) if @gender.present?
    @dogs = @dogs.where(is_hypoallergenic: @hypoallergenic) if @hypoallergenic.present?
    @dogs = @dogs.where(is_sterilized: @sterilized) if @sterilized.present?

    query = colors.map { |color| "color ILIKE '%#{color}%'"  }.join(" OR ")

    @dogs = @dogs.where(query)
    # Silvia if you are going to change this code then tell me first so I can copy it becuase I like this code

  end

  def show
    @shelter = @dog.user

    @marker = {
        latitude: @shelter.latitude,
        longitude: @shelter.longitude
      }
  end

  def new
    @dog = Dog.new
    @breed = ["Norrbottenspets", "Old English Sheepdog", "Parson Russell Terrier", "Pomeranian", "Rottweiler", "Russell Terrier", "Akita", "Beagle", "French Bulldog", "Dalmatian", "German Sheperd", "Labrador", "Maltese", "Dachshund", "Doberman", "Chihuahua"]
  end

  def create
    @dog = Dog.new(dog_params)
    params[:dog][:color].delete_at(0)
    @dog.color = params[:dog][:color]
    @dog.user = current_user

    @dog.pictures = params[:dog][:pictures]

    if @dog.save
      redirect_to mydogs_path
    else
      render :new
    end
  end

  def edit
    @breed = ["Norrbottenspets", "Old English Sheepdog", "Parson Russell Terrier", "Pomeranian", "Rottweiler", "Russell Terrier", "Akita", "Beagle", "French Bulldog", "Dalmatian", "German Sheperd", "Labrador", "Maltese", "Dachshund", "Doberman", "Chihuahua"]
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
      redirect_to mydogs_path
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
    redirect_to mydogs_path
  end

  def me
    @user = User.find(current_user.id)
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :gender, :date_of_birth, :size, :breed, :color, :is_hypoallergenic, :is_sterilized, :photo, {pictures: []})
  end

  def find_dog
    @dog = Dog.find(params[:id])
  end

end
