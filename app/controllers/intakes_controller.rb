class IntakesController < ApplicationController
  before_action :set_intake, only: %i[show edit update destroy]

  # GET /intakes or /intakes.json
  def index
    @intakes = current_user.intakes.order('id desc')
  end

  # GET /intakes/1 or /intakes/1.json
  def show
    @foods = @intake.foods
    @meals = @intake.meals
  end

  # GET /intakes/new
  def new
    @intake = Intake.new
    @intake.eatings.build
    @foods = {
      'default' => Food.format_for_dropdown(Food.default_foods),
      'user saved' => Food.format_for_dropdown(Food.user_foods(current_user.id))
    }
    @meals = Meal.user_meals(current_user.id)
  end

  # GET /intakes/1/edit
  def edit
    @foods = {
      'default' => Food.format_for_dropdown(Food.default_foods),
      'user saved' => Food.format_for_dropdown(Food.user_foods(current_user.id))
    }
    @meals = Meal.user_meals(current_user.id)
    @intake_meals = @intake.eatings.meals || Eating.new(eatable_type: 'Meal')
  end

  # POST /intakes or /intakes.json
  def create
    @intake = current_user.intakes.build(intake_params)

    respond_to do |format|
      if @intake.save
        @intake.calculate_calories
        format.html { redirect_to intakes_url, notice: 'Intake was successfully created.' }
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
        @intake.calculate_calories
        format.html { redirect_to @intake, notice: 'Intake was successfully updated.' }
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
      format.html { redirect_to intakes_url, notice: 'Intake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_intake
    @intake = Intake.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def intake_params
    params.require(:intake).permit(:calories, :time, :date, eatings_attributes: %i[id eatable_id eatable_type quantity _destroy])
  end
end
