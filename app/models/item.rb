require 'csv'

class Item < ApplicationRecord

  def self.to_csv
    attributes = %w{time close high low open volumefrom volumeto}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end
end
