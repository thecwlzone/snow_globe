#---
# Excerpted from "Take My Money",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrwebpay for more book information.
#---
module StripeHandler

  class CustomerSubscriptionDeleted

    attr_accessor :event, :success, :payment

    def initialize(event)
      @event = event
      @success = false
    end

    def remote_subscription
      @event.data.object
    end

    def subscription
      @subscription ||= Subscription.find_by(remote_id: remote_subscription.id)
    end

    def run
      subscription&.canceled!
    end

  end

end
