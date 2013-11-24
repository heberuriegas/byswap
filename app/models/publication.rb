class Publication < ActiveRecord::Base
  attr_accessible :amount, :currency, :expires_at

  monetize :amount_cents, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999999 }

  def expires_at= n
    self[:expires_at] = DateTime.now+n.to_i.days
  end

  def expires_at
    if self[:expires_at].present?
      if self[:expires_at] > DateTime.now
        Time.diff(DateTime.now, self[:expires_at], '%d')[:diff].to_i
      else
        -1
      end
    else
      0
    end
  end
end