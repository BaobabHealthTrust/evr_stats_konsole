# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'sites_with_ip.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    site_detail = SiteDetail.new
    site_detail.site_name = row['Site Name']
    site_detail.site_ip = row['IP Address']
    site_detail.save
    puts "#{site_detail.site_name}@#{site_detail.site_ip} saved"
end
  
puts "There are now #{SiteDetail.count} site records in total"