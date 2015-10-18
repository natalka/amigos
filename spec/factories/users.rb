FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
  end

  factory :deliverer, parent: :user do
    email 'deliverer@example.com'
    after(:create) {|deliverer| deliverer.add_role(:deliverer)}
  end

  factory :customer, parent: :user do
    email 'customer@example.com'
    after(:create) {|customer| customer.add_role(:customer)}
  end

end
