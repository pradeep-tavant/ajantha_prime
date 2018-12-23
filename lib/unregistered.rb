registered = Member.all.map(&:login)
available = []
['A','B'].each do |block|
  ['GF','FF','SF','TF','FOF'].each do |floor|
    (1..12).to_a.map{|x| ('%02d' % x)}.each do |flat|
      available << (floor + flat + "-" + block)
    end
  end
end
puts (available - registered)