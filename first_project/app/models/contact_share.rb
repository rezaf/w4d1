class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true
  
  belongs_to(
    :contact,
    class_name: "Contact",
    foreign_key: :contact_id,
    primary_key: :id
  )
  
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  validate :user_cannot_have_two_shares_for_same_contact
  
  def user_cannot_have_two_shares_for_same_contact
    self.user.contact_shares.each do |contact_share|
      if contact_share.contact_id == self.contact_id
        errors[:user_id] << "cannot have two shares for same contact"
      end
    end
  end
end
