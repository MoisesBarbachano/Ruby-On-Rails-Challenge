require 'rails_helper'

RSpec.describe Website, type: :model do
  subject(:website) { Website.create(url: long_url, visited: 1) }

  let(:long_url) { SecureRandom.hex(10) }

  it { is_expected.to validate_presence_of :url }
  it { is_expected.to validate_presence_of :visited }
end
