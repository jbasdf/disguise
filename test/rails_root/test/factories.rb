Factory.sequence :name do |n|
  "a_name#{n}"
end

Factory.define :user do |f|
  f.name { Factory.next(:name) }
end
