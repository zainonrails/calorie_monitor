json.extract! food, :id, :name, :calories, :water, :protiens, :carbs, :calcium, :phosphorus, :sodium, :iron, :fat, :potassium, :quantity, :created_at, :updated_at
json.url food_url(food, format: :json)
