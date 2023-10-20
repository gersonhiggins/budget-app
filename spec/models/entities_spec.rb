require 'rails_helper'

RSpec.describe Entity, type: :model do
    describe "validations" do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_most(15) }
      it { should validate_presence_of(:amount) }
      it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
    end
  
    describe "associations" do
      it { should belong_to(:author).class_name("User").with_foreign_key(:author_id) }
    end
  end