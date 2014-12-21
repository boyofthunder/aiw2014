class Content < ActiveRecord::Base
  belongs_to :result
  attr_accessible :rank
end
