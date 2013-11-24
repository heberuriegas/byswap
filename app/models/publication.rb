class Publication < ActiveRecord::Base
  monetize :amount_cents, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
end