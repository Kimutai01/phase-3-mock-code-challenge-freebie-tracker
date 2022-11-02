class Company < ActiveRecord::Base
    has_many :freebies

    def freebies
        Freebie.where(company_id: self.id)
    end

    def devs
        self.freebies.map do |freebie|
            freebie.dev
        end
    end

    def give_freebie(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    end

    def self.oldest_company
        self.order(founding_year: :asc).first
    end


end
