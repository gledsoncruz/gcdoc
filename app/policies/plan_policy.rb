class PlanPolicy < ApplicationPolicy
  def index?
  	user.role.eql?('super')
  end
end
