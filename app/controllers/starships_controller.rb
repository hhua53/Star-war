class StarshipsController < ApplicationController
  before_action :set_starship, only: [:show, :edit, :update, :destroy]

  # GET /starships
  # GET /starships.json
  def index
    @starships = Starship.all
  end

  # GET /starships/1
  # GET /starships/1.json
  def show
    @starships = Starship.includes(:films)
  end

  # GET /starships/new
  def new
    @starship = Starship.new
  end

  # GET /starships/1/edit
  def edit
  end

  # POST /starships
  # POST /starships.json
  def create
    @starship = Starship.new(starship_params)

    respond_to do |format|
      if @starship.save
        format.html { redirect_to @starship, notice: 'Starship was successfully created.' }
        format.json { render :show, status: :created, location: @starship }
      else
        format.html { render :new }
        format.json { render json: @starship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /starships/1
  # PATCH/PUT /starships/1.json
  def update
    respond_to do |format|
      if @starship.update(starship_params)
        format.html { redirect_to @starship, notice: 'Starship was successfully updated.' }
        format.json { render :show, status: :ok, location: @starship }
      else
        format.html { render :edit }
        format.json { render json: @starship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /starships/1
  # DELETE /starships/1.json
  def destroy
    @starship.destroy
    respond_to do |format|
      format.html { redirect_to starships_url, notice: 'Starship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_starship
      @starship = Starship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def starship_params
      params.require(:starship).permit(:name)
    end
end
