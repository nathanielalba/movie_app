class Movie < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates :title, :description, :runtime, :image, presence: true
	has_many :comments, as: :commentable
	searchkick
end
