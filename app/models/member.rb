class Member < ApplicationRecord
    class << self
        def search(query)
            rel = order("number")
            if query.present?
                rel = rel.where("name LIKE ? OR name LIKE ?", "%#{query}%", "%#{query}%")
            end
            rel
        end
    end
end
