json.extract! plan, :id, :name, :price, :recurring, :period, :cycles, :num_doc, :created_at, :updated_at
json.url plan_url(plan, format: :json)