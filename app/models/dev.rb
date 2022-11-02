class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def freebies
        Freebie.where(dev_id: self.id)
    end

    def companies
        self.freebies.map do |freebie|
            freebie.company
        end
    end

    def recieved_one?(item_name)
        self.freebies.any? do |freebie|
            freebie.item_name == item_name
        end
    end

    def give_away(dev, freebie)
        freebie.dev_id = dev.id
        freebie.save
    end

end
