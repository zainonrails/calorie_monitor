class IntakesController < ApplicationController
  before_action :set_intake, only: %i[ show edit update destroy ]

  # GET /intakes or /intakes.json
  def index
    @intakes = Intake.all
  end

  # GET /intakes/1 or /intakes/1.json
  def show
  end

  # GET /intakes/new
  def new
    @intake = Intake.new
    @foods = {
      'default' => Food.format_for_dropdown(Food.default_foods),
      'user saved' => Food.format_for_dropdown(Food.user_foods(current_user.id))
    }
  end

  # GET /intakes/1/edit
  def edit
  end

  # POST /intakes or /intakes.json
  def create
    @intake = Intake.new(intake_params)

    respond_to do |format|
      if @intake.save
        format.html { redirect_to @intake, notice: "Intake was successfully created." }
        format.json { render :show, status: :created, location: @intake }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /intakes/1 or /intakes/1.json
  def update
    respond_to do |format|
      if @intake.update(intake_params)
        format.html { redirect_to @intake, notice: "Intake was successfully updated." }
        format.json { render :show, status: :ok, location: @intake }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intakes/1 or /intakes/1.json
  def destroy
    @intake.destroy
    respond_to do |format|
      format.html { redirect_to intakes_url, notice: "Intake was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def meal_intake
  end

  def food_intake
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_intake
    @intake = Intake.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def intake_params
    params.require(:intake).permit(:calories, :time, eatings_attributes: %i[eatable_id eatable_type quantity])
  end
end