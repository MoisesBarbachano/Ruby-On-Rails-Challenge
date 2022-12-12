class Website < ApplicationRecord
  validates :url, presence: true
  validates :visited, presence: true

  after_create :generate_short_url

  def generate_short_url
    self.short_url = bijective_encode(self.id)

    self.save!
  end

  private

  def bijective_encode(i)
    alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

    return alphabet[0] if i == 0
    s = ''
    base = alphabet.length
    while i > 0
      s << alphabet[i.modulo(base)]
      i /= base
    end
    s.reverse
  end 
end
