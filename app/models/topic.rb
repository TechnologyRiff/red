class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

   def self.search(search)
     where('name like ?', "%#{search}%")

      #Topic.all({conditions: ['name like ?', search]})
      #@posts = Post.visible_to(current_user).find (:all, conditions => ['name like ?', "%#{params[:search]}"])
   end
  
  # Topic.where('name like ?', "%#{search}%")

  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  private
    scope :publicly_viewable, -> { where(public: true) }

    scope :privately_viewable, -> { where(public: false) }
end