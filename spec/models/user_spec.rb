require 'rails_helper'

RSpec.describe User, type: :model do
  it "when attributes is valid" do
    user = User.new(email: "silvio_santos@sbt.com.br", password: "1milhao")

    expect(user).to be_valid
  end

  it "when doesnt email exists" do
    user = User.new(password: "password")

    expect(user).to_not be_valid
  end
end
