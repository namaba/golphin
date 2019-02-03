class Condition
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :area_code, array: :integer
  attribute :play_date, :date
  attribute :min_price, :integer
  attribute :max_price, :integer
  attribute :start_time_zone, :integer
  attribute :plan_lunch, :boolean
  attribute :plan_2_sum, :boolean
  attribute :plan_caddie, :boolean
  attribute :ng_plan, :string
end