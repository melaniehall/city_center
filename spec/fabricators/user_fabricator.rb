Fabricator(:user) do
  email { sequence(:email) { |i| "user#{1}@example.com"} }
  password "password"
  password_confirmation "password"
end