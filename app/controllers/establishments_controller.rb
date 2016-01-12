class EstablishmentsController < ApplicationController
  before_action :set_Establishment, only: [:show, :edit, :update, :destroy]

  # GET /Establishments
  # GET /Establishments.json
  def index
    @establishments = Establishment.all
  end

  # GET /Establishments/1
  # GET /Establishments/1.json
  def show
    @establishment = Establishment.find(params[:id])
    # respond_with(@establishment)

  end

  # GET /Establishments/new
  def new
    @establishment = Establishment.new
  end

  # GET /Establishments/1/edit
  def edit
  end

  # Add and remove favorite establishments
  # for current_user
  def favorite
    type = params[:type]
    @establishment=Establishment.find(params[:id])
    @current_user=User.first
    if type == "favorite"
      pry
      # @current_user=User.first
      @current_user.favorites << @establishment
      redirect_to :back, notice: 'You favorited #{@establishment.name}'

    elsif type == "unfavorite"
      @current_user.favorites.delete(@establishment)
      redirect_to :back, notice: 'Unfavorited #{@establishment.name}'

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


  # POST /Establishments
  # POST /Establishments.json
  def create
    @establishment = Establishment.new(Establishment_params)

    respond_to do |format|
      if @Establishment.save
        format.html { redirect_to @Establishment, notice: 'Establishment was successfully created.' }
        format.json { render :show, status: :created, location: @Establishment }
      else
        format.html { render :new }
        format.json { render json: @Establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Establishments/1
  # PATCH/PUT /Establishments/1.json
  def update
    respond_to do |format|
      if @establishment.update(establishment_params)
        format.html { redirect_to @Establishment, notice: 'Establishment was successfully updated.' }
        format.json { render :show, status: :ok, location: @Establishment }
      else
        format.html { render :edit }
        format.json { render json: @Establishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Establishments/1
  # DELETE /Establishments/1.json
  def destroy
    @establishment.destroy
    respond_to do |format|
      format.html { redirect_to Establishments_url, notice: 'Establishment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Establishment
      @establishment = Establishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def Establishment_params
      params.require(:Establishment).permit(:name, :city)
    end
end
