class DogsController < ApplicationController
  before_action :find_dog, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:query]
    @dogs = []
    if @query.empty?
      @users = User.where.not(longitude:nil, latitude:nil)
    else
      @users = User.near(@query, 500)
    end
    @users.each do |user|
      Dog.where(user: user).each do |dog|
        @dogs << dog
      end
    end
  end

  def show
    @shelter = @dog.user

    @marker = @shelter.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude
      }
    end
  end

  def new
    @dog = Dog.new
    @breed = ["Norrbottenspets", "Old English Sheepdog", "Parson Russell Terrier", "Pomeranian", "Rottweiler", "Russell Terrier", "Akita", "Beagle", "French Bulldog", "Dalmatian", "German Sheperd", "Labrador", "Maltese", "Dachshund", "Doberman", "Chihuahua"]
  end

  def create
    params[:dog][:color].delete_at(0)
    @dog = Dog.new(dog_params)
    @dog.user = current_user
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
    params.require(:dog).permit(:name, :gender, :date_of_birth, :size, :breed, :color, :is_hypoallergenic, :is_sterilized, :pictures, :photo)
  end

  def find_dog
    @dog = Dog.find(params[:id])
  end

end
