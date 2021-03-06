class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  #validates
  validates_presence_of :title, :description, :category, :price, :picture

  # paperclip
  has_attached_file :picture, styles: { medium: "253x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  # gem money-rails
  monetize :price_cents

  # Scopes
	scope :descending_order, -> (quantidade = 9) {limit(quantidade).order(created_at: :desc)}
	scope :to_the, -> (member) {where(member: member)}

end
