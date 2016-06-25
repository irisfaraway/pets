class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy, :feed]
  before_action :update_hunger, only: [:show]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = Pet.new(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Feed pet to reset its hunger
  def feed
    @pet.update_attribute(:last_fed, DateTime.current)
    update_hunger
    respond_to do |format|
      format.html { redirect_to @pet, notice: 'Pet was successfully fed.' }
      format.json { render :show, status: :ok, location: @pet }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pet
    @pet = Pet.find(params[:id])
  end

  def update_hunger
    # Check how much time has passed since last fed
    time_since_last_fed = (DateTime.current.to_f - @pet.last_fed.to_f) / 6000
    # Update hunger based on elapsed time, max 1
    updated_hunger = if time_since_last_fed >= 1
                       1
                     else
                       time_since_last_fed
                     end
    @pet.update_attribute(:hunger, updated_hunger)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pet_params
    params.require(:pet).permit(:name,
                                :last_fed)
  end
end
