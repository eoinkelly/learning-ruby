class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  # Validate that each of these fields exist and it's contents are not empty.
  validates :title, :description, :image_url, presence: true

  # We want to validate price against $0.01 to guard against the user entering 0.0001 etc.
  validates :price, numericality: { greater_than_or_equal_to: 0.01}

  validates :title, uniqueness: true

  validates :image_url,
            # allow_blank: true,
            format: {
              with: %r{\.(gif|png|jpg|jpeg)\Z}i,
              message: 'must be a URL for GIF, JPG or PNG image.'
            }
end
