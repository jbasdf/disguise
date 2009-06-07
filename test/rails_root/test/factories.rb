Factory.sequence :name do |n|
  "a_name#{n}"
end

Factory.sequence :uri do |n|
  "n#{n}.example.com"
end

Factory.define :user do |f|
  f.name { Factory.next(:name) }
end

Factory.define :domain_theme do |f|
  f.name { Factory.next(:name) }
  f.uri { Factory.next(:uri) }
end