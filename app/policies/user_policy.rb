class UserPolicy < ApplicationPolicy

  def index?
  	user.role.eql?('super') || user.role.eql?('admin')
  end
end
