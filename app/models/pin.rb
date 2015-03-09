class Pin < ActiveRecord::Base
	attr_accessible :description, :image

	belongs_to :user
    has_attached_file :image,
    				  #:s3_credentials => "#{Rails.root}/config/s3.yml",
    				  styles: { medium: "320x240>", small: "160x120>"}

    validates :description, presence: true
    validates :user_id, presence: :true
    validates_attachment :image, presence: true,
    							 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
    							 size: { less_than: 0.5.megabytes }

    

    
end
