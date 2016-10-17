class UserPolicy < ApplicationPolicy

  def index?
  	user.role.eql?('super') || user.role.eql?('admin')
  end
  def new?
    user.role.eql?('super') || user.role.eql?('admin')
  end
  def create
    new?
  end
end
