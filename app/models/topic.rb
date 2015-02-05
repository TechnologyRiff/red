class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  def self.search(search)
    if search
      find(:all, conditions => ['name like ?', "%#{search}"])
      #@posts = Post.visible_to(current_user).find (:all, conditions => ['name like ?', "%#{params[:search]}"])
    # else
    #   find(:all)
    end
  end

  scope :visible_to, -> (user) { user ? all : publicly_viewable }

  private
    scope :publicly_viewable, -> { where(public: true) }

    scope :privately_viewable, -> { where(public: false) }
end