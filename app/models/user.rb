class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  belongs_to :plan
  has_many :customers, class_name: "User", foreign_key: "customer_id"
  has_many :documents, class_name: "Document", foreign_key: "user_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email
  validates_integrity_of :avatar
  validates_processing_of :avatar

  ROLES = %w[admin customer]

  def active_for_authentication?
    active
  end

  def inactive_message
    "Desculpe, esta conta foi desativada"
  end

  def count_admin_clients
    self.customers.count
  end

  def count_admin_clients_per_plan
    self.plan.num_client
  end

  def count_documents_per_admin
    self.documents.count
  end

  def count_admin_documents_per_plan
    self.plan.num_doc
  end

  def percent_admin_clients
    tot_clients = count_admin_clients
    tot_clients_per_plan = self.plan.num_client
    percent = (tot_clients * 100) / tot_clients_per_plan
    return percent
  end



end
