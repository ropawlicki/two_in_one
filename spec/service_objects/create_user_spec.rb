require 'rails_helper'

RSpec.describe CreateUser do
  let(:params) { { "name" => "Bob", "email"  => "bob@example.com", "house_number"  => "4", "street"  => "Bob's Street", "city"  => "Bobtown" } }
  let(:user) { CreateUser.new(params).call }

  context "creates valid models" do
    it "with valid params" do
      expect(user.valid?).to eq true
      expect(user.address.valid?).to eq true
    end

    it "with valid params and blank house_number" do
      params["house_number"] = ""
      expect(user.address.valid?).to eq true
    end
  end

  context 'creates invalid models' do
    it "with blank name" do
      params["name"] = ""
      expect(user.valid?).to eq false
    end

    it "with taken e-mail" do
      (CreateUser.new(params).call).save
      expect(user.valid?).to eq false
    end

    it "with badly formatted e-mail" do
      params["email"] = "bob@examplecom" ; expect(user.valid?).to eq false
      params["email"] = "bobexample.com" ; expect(user.valid?).to eq false
      params["email"] = "bob@exa@mple.com" ; expect(user.valid?).to eq false
      params["email"] = "bob@exam.ple.com" ; expect(user.valid?).to eq false
    end

    it "with non-numeric input for house number field" do
      params["house_number"] = "d"
      expect(user.address.valid?).to eq false
    end

    it "with blank city" do
      params["city"] = ""
      expect(user.address.valid?).to eq false
    end
  end
end