# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Plan.delete_all

basic = Plan.create(name: 'Plano Básico', price: 100.0, recurring: true, period: 'month', cycles: 12, num_doc: 50, num_client: 100)
inter = Plan.create(name: 'Plano Intermediário', price: 200.0, recurring: true, period: 'month', cycles: 12, num_doc: 200, num_client: 200)
advanced = Plan.create(name: 'Plano Avançado', price: 300.0, recurring: true, period: 'month', cycles: 12, num_doc: 1000, num_client: 500)

superuser = User.create(email: 'super@super.com', password: 'super123', role: 'super', full_name: 'Superuser')
admin = User.create(email: 'admin@admin.com', password: 'admin123', role: 'admin', full_name: 'Administrator', plan: basic)



User.create(email: 'customer@email.com', password: 'customer123', role: 'customer', customer_id: admin.id, full_name: 'Customer')