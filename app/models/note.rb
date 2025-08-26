class Note < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :title, length: { maximum: 255 }
  validates :content, length: { maximum: 10000 }

  scope :search, ->(query) {
    where("title ILIKE ? OR content ILIKE ?", "%#{query}%", "%#{query}%")
  }

  # Generate UUID before creating
  before_create :generate_public_id
  
  def shareable_url
    return nil unless shareable?
    # Generate public_id if missing (for existing records)
    ensure_public_id
    Rails.application.routes.url_helpers.shared_note_url(public_id)
  end
  
  private
  
  def generate_public_id
    self.public_id = SecureRandom.uuid
  end
  
  def ensure_public_id
    if public_id.blank?
      self.update_column(:public_id, SecureRandom.uuid)
    end
  end
end