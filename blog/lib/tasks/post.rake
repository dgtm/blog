namespace :post do
desc "Populate posts"
task :populate => :environment do |row|
  [
    {:blogger =>"abc",:title =>"A", :body =>"Thank You"},
    {:blogger =>"def",:title =>"B", :body =>"Thank You Very much"},
    {:blogger =>"ghi",:title =>"C", :body =>"Danke"},
    {:blogger =>"jkl",:title =>"D", :body =>"Fielen Danke"},
    ].each do |attributes|
      Post.find_or_create_by_blogger_and_title_and_body(attributes)
    end
end
end