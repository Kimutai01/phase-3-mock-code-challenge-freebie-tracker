class Freebie < ActiveRecord::Base
    belongs_to :company
    belongs_to :dev

    def dev
        Dev.find(self.dev_id)
    end

    def company
        Company.find(self.company_id)
    end

end
