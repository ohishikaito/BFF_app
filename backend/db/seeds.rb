(1..30).each do |i|
  Post.create!(
    name: "#{i}",
    user_id: 33
  )
end