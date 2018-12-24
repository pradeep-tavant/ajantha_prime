registered = Member.all.map(&:login)
available = []
['A','B'].each do |block|
  last_flat = block == 'A' ? 11 : 12
  ['GF','FF','SF','TF','FOF'].each do |floor|
    (1..last_flat).to_a.map{|x| ('%02d' % x)}.each do |flat|
      available << (floor + flat + "-" + block)
    end
  end
end
puts (available - registered)
