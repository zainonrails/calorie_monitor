module Foods
  class Importer
    attr_accessor :errors, :path, :user_id

    def initialize(path, user_id)
      self.path = path
      self.user_id = user_id
      self.errors = []
    end

    def self.call(path, user_id)
      obj = new(path, user_id)
      obj.call
      obj
    end

    def call
      foods = []
      rows = SmarterCSV.process(path, options)
      rows.each do |row|
        food = Food.new(row)
        food.quantity = 100
        food.user_id = user_id
        food.is_default = true
        foods << food
      end
      Food.import(foods)
    end

    private

    def options
      {
        required_headers: headers,
        key_mapping: { carbohydrates: :carbs, food_name: :name }
      }
    end

    def headers
      %i[name calories water proteins fat carbs phosphorus sodium potassium iron calcium]
    end
  end
end
