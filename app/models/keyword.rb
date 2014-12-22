class Keyword < ActiveRecord::Base
  belongs_to :admin_user
  has_many :results
  attr_accessible :status, :query
  #scope :current_user,where(:admin_user_id => current_admin_user.id)
  # def index
  #        @keywords = Keyword.where(:admin_user_id => current_admin_user.id)
  #      end
  # def index
  #   @keywords = Keyword.where(:admin_user_id => current_admin_user.id)
  # end

end
