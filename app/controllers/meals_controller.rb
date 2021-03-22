class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  # GET /meals or /meals.json
  def index
    @meals = current_user.meals.order('id desc')
  end

  # GET /meals/1 or /meals/1.json
  def show
  end

  # GET /meals/new
  def new
    @meal = Meal.new
    @foods = {
      'default' => Food.format_for_dropdown(Food.default_foods),
      'user saved' => Food.format_for_dropdown(Food.user_foods(current_user.id))
    }
    # @foods = Food.select('id', 'name AS text')
  end

  # GET /meals/1/edit
  def edit
    @foods = {
      'default' => Food.format_for_dropdown(Food.default_foods),
      'user saved' => Food.format_for_dropdown(Food.user_foods(current_user.id))
    }
  end

  # POST /meals or /meals.json
  def create
    @meal = current_user.meals.build(meal_params)

    respond_to do |format|
      if @meal.save
        @meal.calculate_calories
        format.html { redirect_to @meal, notice: "Meal was successfully created." }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1 or /meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        @meal.calculate_calories
        format.html { redirect_to @meal, notice: "Meal was successfully updated." }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1 or /meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: "Meal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meal
    @meal = Meal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def meal_params
    params.require(:meal).permit(:name, :description, :time, meal_foods_attributes: %i[id food_id quantity _destroy])
  end
end
