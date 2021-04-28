class Member < ApplicationRecord
    validates :number, presence: true,
        numericality: {
            only_integer: true,
            greater_than: 0,
            less_than: 1000,
            allow_blank: true
        },
        uniqueness: true
    
    validates :name, presence: true,
        length: {minimum: 2, maximum: 20, allow_blank: true },
        uniqueness: { case_sensitive: false }

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
