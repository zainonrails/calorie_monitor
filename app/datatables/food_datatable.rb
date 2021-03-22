class FoodDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include Rails.application.routes.url_helpers

  def_delegator :@view, :link_to

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: 'Food.id', cond: :eq },
      name: { source: 'Food.name', cond: :like },
      calories: { source: 'Food.calories', cond: :eq },
      water: { source: 'Food.water', cond: :eq },
      proteins: { source: 'Food.proteins', cond: :eq },
      carbs: { source: 'Food.carbs', cond: :eq },
      calcium: { source: 'Food.calcium', cond: :eq },
      phosphorus: { source: 'Food.phosphorus', cond: :eq },
      sodium: { source: 'Food.sodium', cond: :eq },
      iron: { source: 'Food.iron', cond: :eq },
      fat: { source: 'Food.fat', cond: :eq },
      potassium: { source: 'Food.potassium', cond: :eq },
      quantity: { source: 'Food.quantity', cond: :eq }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: link_to(record.name, food_path(record.id)),
        calories: record.calories,
        water: record.water,
        proteins: record.proteins,
        carbs: record.carbs,
        calcium: record.calcium,
        phosphorus: record.phosphorus,
        sodium: record.sodium,
        iron: record.iron,
        fat: record.fat,
        potassium: record.potassium,
        quantity: record.quantity
      }
    end
  end

  def get_raw_records
    Food.where(is_default: true)
  end

end
