#---
# Excerpted from "Take My Money",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrwebpay for more book information.
#---
class ShoppingCart < ApplicationRecord

  belongs_to :user
  belongs_to :address, optional: true
  belongs_to :discount_code
  belongs_to :affiliate, optional: true

  enum shipping_method: {electronic: 0, standard: 1, overnight: 2}

  def self.for(user:)
    return nil unless user
    ShoppingCart.find_or_create_by(user_id: user.id)
  end

  def price_calculator
    @price_calculator ||= PriceCalculator.new(
        tickets, discount_code, shipping_method.to_s,
        address: address, user: user, tax_id: "cart_#{id}")
  end

  delegate :processing_fee, :sales_tax, to: :price_calculator

  def total_cost
    price_calculator.total_price
  end

  def tickets
    @tickets ||= user.tickets_in_cart
  end

  def events
    tickets.map(&:event).uniq.sort_by(&:name)
  end

  def tickets_by_performance
    tickets.group_by { |t| t.performance.id }
  end

  def performance_count
    tickets_by_performance.each_pair.each_with_object({}) do |pair, result|
      result[pair.first] = pair.last.size
    end
  end

  def performances_for(event)
    tickets.map(&:performance)
        .select { |performance| performance.event == event }
        .uniq.sort_by(&:start_time)
  end

  def subtotal_for(performance)
    tickets_by_performance[performance.id].sum(&:price)
  end

  def item_attribute
    :ticket_ids
  end

  def item_ids
    tickets.map(&:id)
  end

end
