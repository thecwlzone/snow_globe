#---
# Excerpted from "Take My Money",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/nrwebpay for more book information.
#---
require "active_record/fixtures"

user = CreateAdminService.new.call
Rails.logger.ap("CREATED ADMIN USER: " << user.email)

ActiveRecord::FixtureSet.create_fixtures(
    "#{Rails.root}/spec/fixtures", "events")
ActiveRecord::FixtureSet.create_fixtures(
    "#{Rails.root}/spec/fixtures", "performances")
ActiveRecord::FixtureSet.create_fixtures(
    "#{Rails.root}/spec/fixtures", "tickets")
ActiveRecord::FixtureSet.create_fixtures(
    "#{Rails.root}/spec/fixtures", "users")
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?