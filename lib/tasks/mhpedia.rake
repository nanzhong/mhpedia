namespace :mhpedia do
  namespace :load do
    desc 'Load initial item DB'
    task :items => :environment do
      puts 'Loading initial item info DB'

      data = File.readlines("#{Rails.root}/db/data/items.tsv")
      header = data.shift.split("\t").map {|f| f.strip}

      updated = 0

      data.each do |item|
        item_data = {}
        data_fields = item.split("\t")
        header.each_with_index do |field, i|
          item_data[field] = data_fields[i].strip
        end

        items = Item.where(name: item_data['name'])
        if items.count == 1
          item = items.first
          item.img = item_data['img']
          item.description = item_data['description']
          item.rarity = item_data['rarity'].to_i
          item.buy = item_data['buy'].to_i
          item.sell = item_data['sell'].to_i
          item.save

          updated += 1
        else
          puts "Could not match item #{item_data.inspect}"
        end
      end

      puts "Loaded #{updated} items"
    end

    desc 'Load map data'
    task :maps => :environment do
      puts 'Loading map data'

      data = File.readlines("#{Rails.root}/db/data/maps.tsv")
      header = data.shift.split("\t").map {|f| f.strip}
      data.each do |map|
        map_data = {}
        data_fields = map.split("\t")
        header.each_with_index do |field, i|
          map_data[field] = data_fields[i].strip
        end

        map = Map.where(name: map_data['name'])
        if map.empty?
          map = Map.new
          map.name = map_data['name']
          (0..(map_data['areas'].to_i)).each do |i|
            area = Area.new
            area.zone = i
            area.save
            map.areas << area
          end

          map.save
        end
      end

      puts "Loaded maps (#{Map.count} maps in DB)"
    end

    desc 'Load monster reward db'
    task :monsters => :environment do
      puts 'Loading initial monster db'

      data = File.readlines("#{Rails.root}/db/data/monsters.tsv")
      header = data.shift.split("\t").map {|f| f.strip}

      data.each do |reward|
        reward_data = {}
        data_fields = reward.split("\t")
        header.each_with_index do |field, i|
          reward_data[field] = data_fields[i].strip
        end

        monsters = Monster.where(name: reward_data['name'])
        monster = nil
        if monsters.empty?
          monster = Monster.new
          monster.name = reward_data['name']
          monster.save
        else
          monster = monsters.first
        end

        items = Item.where(name: reward_data['item'])

        item = nil
        if items.empty?
          item = Item.new
          item.name = reward_data['item']
          item.save
        else
          item = items.first
        end

        if monster.monster_rewards.where(item_id: item.id, rank: reward_data['rank'], action: reward_data['action']).count > 0
          puts "Skipping #{reward_data.inspect}"
          next
        end

        reward = MonsterReward.new
        reward.item = item
        reward.monster = monster
        reward.action = reward_data['action']
        reward.rank = reward_data['rank']
        reward.drop_rate = reward_data['drop_rate'].to_i
        reward.save
      end

      puts "Loaded resources (#{MonsterReward.count} resources in DB)"
    end

    desc 'Load initial resourced db'
    task :resources => :environment do
      puts 'Loading intial resources DB'

      data = File.readlines("#{Rails.root}/db/data/resources.tsv")
      header = data.shift.split("\t").map {|f| f.strip}

      data.each do |res|
        res_data = {}
        data_fields = res.split("\t")
        header.each_with_index do |field, i|
          res_data[field] = data_fields[i].strip
        end

        maps = Map.where(name: res_data['map'])
        raise "Could not determine the correct map #{res_data['map']}" if maps.count != 1
        map = maps.first

        areas = map.areas.where(zone: res_data['area'].to_i)
        raise "Could not determine the correct area #{res_data['area']}" if areas.count != 1
        area = areas.first

        items = Item.where(name: res_data['item'])

        item = nil
        if items.empty?
          item = Item.new
          item.name = res_data['item']
          item.save
        else
          item = items.first
        end

        if area.resources.where(item_id: item.id).count > 0
          puts "Skipping #{res_data.inspect}"
          next
        end

        resource = Resource.new
        resource.item = item
        resource.area = area
        resource.save
      end

      puts "Loaded resources (#{Resource.count} resources in DB)"
    end
  end
end
