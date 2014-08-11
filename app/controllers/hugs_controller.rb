class HugsController < ApplicationController
	before_action :set_hug, only: [:show, :edit, :update, :destroy]

  # GET /hugs
  # GET /hugs.json
  def index
    @hugs = Hug.all
  end

  # GET /hugs/1
  # GET /hugs/1.json
  def show
  end

  # GET /hugs/new
  def new
    @hug = Hug.new
  end

  # GET /hugs/1/edit
  def edit
  end

  # POST /hugs
  # POST /hugs.json
  def create
    @hug = Hug.new(hug_params)
    @hug.giver = User.find(session[:user_id])

    respond_to do |format|
      if @hug.save
        format.html { redirect_to hugs_path, notice: 'Hug was successfully created.' }
        format.json { render :index, status: :created, location: @hug }
      else
        format.html { render :new }
        format.json { render json: @hug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hugs/1
  # PATCH/PUT /hugs/1.json
  def update
    respond_to do |format|
      if @hug.update(hug_params)
        format.html { redirect_to @hug, notice: 'Hug was successfully updated.' }
        format.json { render :show, status: :ok, location: @hug }
      else
        format.html { render :edit }
        format.json { render json: @hug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hugs/1
  # DELETE /hugs/1.json
  def destroy
    @hug.destroy
    respond_to do |format|
      format.html { redirect_to hugs_url, notice: 'Hug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hug
      @hug = Hug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hug_params
      params.require(:hug).permit(:giver, :receiver, :appointment, :special_requests)
    end
end
