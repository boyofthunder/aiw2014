class Result < ActiveRecord::Base
  belongs_to :keyword, :polymorphic => true
  has_many :contents

end
