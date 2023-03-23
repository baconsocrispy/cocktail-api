def seed_tools
  tools = File.read(Rails.root.join('lib', 'seeds', 'tools.txt'))
  tools.split("\n").each do |t|
    tool = Tool.find_by(name: t)
    Tool.create!(name: t) unless tool
  end
  p 'Tools successfully seeded'
end