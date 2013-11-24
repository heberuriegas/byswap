class Publication < ActiveRecord::Base
  attr_accessible :amount, :amount_currency, :expires_at, :user_id

  belongs_to :user

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

  def expires_in
    self.expires_at == -1 ? 'Expired' : "#{self.expires_at} #{I18n.t('views.shared.days')}"
  end
end