require 'rails_helper'


describe User do
  describe '#create' do
    it "is invalid without a nickname" do
    user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
    end
  end
  
  describe '#create' do
    it "is invalid without a email" do
    user = User.new(nickname: "hoge", email: "", password: "00000000", password_confirmation: "00000000")
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a password" do
    user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "", password_confirmation: "")
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
    end
  end

  describe '#create' do
    it "is invalid without a password" do
    user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "0000000", password_confirmation: "000000")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe '#create' do
    it "is invalid without a password" do
    user = User.new(nickname: "hoge", email: "kkk@gmail.com", password: "000", password_confirmation: "000")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end