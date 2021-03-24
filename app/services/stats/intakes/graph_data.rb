module Stats
  module Intakes
    class GraphData

      DEFAULTS = {
        group_by: 'day',
        start_date: 1.week.ago,
        end_date: DateTime.current.end_of_day
      }.freeze

      attr_accessor :start_date, :end_date, :group_by, :data, :data_set, :user_id

      def initialize(start_date, end_date, group_by, user_id)
        self.start_date = start_date.presence || DEFAULTS[:start_date]
        self.end_date = end_date.presence || DEFAULTS[:end_date]
        self.group_by = group_by || DEFAULTS[:group_by]
        self.user_id = user_id
      end

      def self.call(start_date, end_date, group_by, user_id)
        obj = new(start_date, end_date, group_by, user_id)
        obj.format_params
        obj.call
        obj
      end

      def call
        self.data = raw_data
        graph_dataset
      end

      # responsible for ensuring params are of correct format
      def format_params
        self.start_date = start_date.to_datetime.beginning_of_day
        self.end_date = end_date.to_datetime.end_of_day
      end

      private

      # responsible for creating labels from raw_data
      def create_graph_labels
        case group_by
        when 'month'
          data.map { |d| d.date.strftime('%b %Y') }
        when 'day'
          data.map { |d| d.date.strftime('%b %d, %Y') }
        when 'year'
          data.map { |d| d.date.strftime('%Y') }
        else
          data.map { |d| d.date.strftime('%b %d, %Y') }
        end
      end

      # responsible to create data for graph from raw_data
      def create_graph_data
        data.map(&:calories)
      end

      def graph_dataset
        self.data_set = {
          graph: {
            labels: create_graph_labels,
            datasets: [
              {
                label: 'Calorie Intake Chart',
                backgroundColor: 'rgba(60,220,220,0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                data: create_graph_data,
                fill: true,
                pointBackgroundColor: 'rgba(40, 167, 69, 1)'
              }
            ]
          },
          options: options
        }
      end

      # responsible to fetch data from database
      def raw_data
        Intake.group_by_data(start_date, end_date, group_by, user_id)
      end

      # extra options for the graph
      def options
        {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }],
            xAxes: [{
              beginAtZero: true
            }]
          }
        }
      end
    end
  end
end
