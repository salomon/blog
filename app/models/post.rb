class Post < ActiveRecord::Base
  # Remember to create a migration!
belongs_to :user
has_and_belongs_to_many :tags

end
