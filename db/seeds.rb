# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sites = [
    ['localhost','127.0.0.1']
]

(sites || []).each do |site|
    site_detail = SiteDetail.new()
    site_detail.site_name = site[0]
    site_detail.site_ip = site[1]

    site_detail.save!
end
