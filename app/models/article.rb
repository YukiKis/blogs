class Article < ApplicationRecord
  belongs_to :homepage_id, counter_cache: true
end
