class Post < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :user_id
  validates :content, :presence => { :message => 'no puedes postear con contenido vacio' }, length: { maximum: 140 }
end
