class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        items = self.freebies.map {|freebie| freebie.item_name}
        items.include?(item_name)
    end

    def give_away(dev, freebie)
        list = self.freebies.map {|freebie| freebie.item_name}
        if list.include?(freebie.item_name) == true
            freebie.dev_id= dev.id
            freebie.save
        else
            "sorry you can't give this away"
        end
        # binding.pry
    end
end
