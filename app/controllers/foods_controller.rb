class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  # GET /foods or /foods.json
  def index
    respond_to do |format|
      format.html
      format.json { render json: FoodDatatable.new(params, view_context: view_context) }
    end
  end

  def user_foods
    @foods = Food.where(user_id: current_user.id, is_default: false)
    respond_to do |format|
      format.html
      format.json { render json: FoodDatatable.new(params, view_context: view_context) }
    end
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    byebug
    admin_options = current_user.admin? ? { is_default: true } : { is_default: false }
    @food = current_user.foods.build(food_params.merge!(admin_options))

    respond_to do |format|
      if @food.save
        format.html { redirect_to @food, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bulk_create
    res = ::Foods::Importer.call('public/foods.csv', current_user.id)
    respond_to do |format|
      if res.errors.present?
        format.html { redirect_to foods_url, notice: 'Something went wrong.' }
      else
        format.html { redirect_to foods_url, notice: 'Foods were successfully imported.' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :calories, :water, :proteins, :carbs,
                                 :calcium, :phosphorus, :sodium, :iron, :fat,
                                 :potassium, :quantity)
  end
end
