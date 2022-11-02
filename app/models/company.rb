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

end
