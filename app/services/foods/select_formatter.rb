module Foods
  class SelectFormatter
    def self.format(data)
      formatted_data = []
      data.each do |d|
        formatted_data << { id: d['id'], text: d['text'] }.as_json
      end
      formatted_data
    end
  end
end
