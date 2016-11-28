class Store < ApplicationRecord
    has_many :users
validates_format_of    :email,    :with  => Devise.email_regexp, :allow_blank => true, :if => :email_changed?
validates_format_of :zipCode, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234",:multiline => true

validates_presence_of :email, :zipCode, :companyName, :address
end
