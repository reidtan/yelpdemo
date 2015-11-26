class Restaurant < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	has_many :reviews

	validates :name, :address, :phone, :website, :image, presence: true
	validates :phone, format: { 
		with: /\A\d{8}\z/, 
		message: "can only be 8 digits"
	}
	validates :website, format: {
		with: /\Ahttps?:\/\/.*\z/,
		message: "must start with http:// or https://"
	}
	validates :address, format: {
		with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{6}\z/,
		message: "must be in the format 350 Fifth Avenue, Singapore, SG 123456"
	}
end
