class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  # marks image for deletion on next save if a new one isnt uploaded
  def image_attributes=(attributes)
    image.clear if has_destroy_flag?(attributes) && !image.dirty?
  end
end
