class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        items = self.freebies.map {|freebie| freebie.item_name}
        items.include?(item_name)
        # self.freebies.any {|f| f.item_name == item_name}
        # freebies.exists?(item_name: item_name)
    end

    def give_away(dev, freebie)
        list = self.freebies.map {|freebie| freebie.item_name}
        if list.include?(freebie.item_name) == true
            freebie.dev_id= dev.id
            freebie.save
        else
            "sorry you can't give this away"
        end

        # if self == freebie.dev
        # freebie.update(dev_id: dev_id)
    end
end
