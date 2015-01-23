require 'rails_helper'

describe "User" do
  describe "passwords" do
    it "needs a password to be valid" do
      u = User.new(name: "Marko", email: "os.chilim@gmail.com")
      u.save
      expect(u).to_not be_valid

      u.password = "password"
      u.password_confirmation = "password2"
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "password"
      u.save
      expect(u).to be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(name: "Marko", password: "password", password_confirmation: "password") }

    it "authenticates with correct password" do
      expect(user.authenticate("password")).to be
    end

    it "doesnt authenticates with an incorrect password" do
      expect(user.authenticate("password2")).to_not be
    end
  end
end