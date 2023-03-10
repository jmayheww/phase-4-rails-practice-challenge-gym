class ClientMembershipSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_membership_cost
  has_many :memberships
  has_many :gyms, through: :memberships

  def total_membership_cost
    "#{object.name} pays a net total of $#{object.memberships.sum(:charge)} for their gym memberships."
  end
end
