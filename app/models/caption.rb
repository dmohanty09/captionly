class Caption < ApplicationRecord
  belongs_to :video
  scope :query, ->(query) {
    words = query.split(' ')
    search_sql = []

    words = words.map do |word|
        search_sql.push('lower(text) LIKE ?')
        "%#{word.downcase}%"
    end

    where( search_sql.join(' or '), *words )
  }
end
