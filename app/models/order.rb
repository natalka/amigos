class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :deliverer, class_name: "User"

  validates :item_desc, presence: true
  validates :to, presence: true
  validates :from, presence: true

  include AASM

  aasm column: :status do
    state :new, :initial => true
    state :in_progress
    state :collected
    state :delivered

    event :pick_up_order do
      transitions :from => :new, :to => :in_progress
    end

    event :collect_order do
      transitions :from => :in_progress, :to => :collected
    end

    event :deliver_to_customer do
      transitions :co => :collected, :to => :delivered
    end

  end
end
