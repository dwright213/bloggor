FactoryGirl.define do
  factory(:user) do
    email('test_email@test.com')
    password "password"
    password_confirmation "password"
  end
end
