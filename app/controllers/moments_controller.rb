class MomentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_moment, only: %i[ show edit update destroy ]

  # GET /moments or /moments.json
  def index
    @upcoming_moments = current_user.moments.order('date ASC').where('date > ?', DateTime.now)
    @past_moments = current_user.moments.order('date DESC').where('date < ?', DateTime.now)
  end

  # GET /moments/1 or /moments/1.json
  def show
  end

  # GET /moments/new
  def new
    @moment = current_user.moments.build
  end

  # GET /moments/1/edit
  def edit
  end

  # POST /moments or /moments.json
  def create
    @moment = current_user.moments.build(moment_params)

    respond_to do |format|
      if @moment.save
        format.html { redirect_to moments_url, notice: "Moment was successfully created." }
        format.json { render :show, status: :created, location: @moment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moments/1 or /moments/1.json
  def update
    respond_to do |format|
      if @moment.update(moment_params)
        format.html { redirect_to moments_url, notice: "Moment was successfully updated." }
        format.json { render :show, status: :ok, location: @moment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moments/1 or /moments/1.json
  def destroy
    @moment.destroy
    respond_to do |format|
      format.html { redirect_to moments_url, notice: "Moment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment
      @moment = Moment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moment_params
      params.require(:moment).permit(:title, :description, :date, :user_id)
    end
end
