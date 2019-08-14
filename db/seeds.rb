require 'csv'

CSV.foreach('db/level.csv', headers: true) do |row|
  Level.create(id: row['id'], level: row['level'], count: row['count'], created_at: row['created_at'], updated_at: row['updated_at'])
end