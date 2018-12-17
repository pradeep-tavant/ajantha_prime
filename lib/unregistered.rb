registered = Member.all.map(&:login)
available = []
(1..12).to_a.map{|x| ('%02d' % x)}.each do |flat|
  ['GF','FF','SF','TF','FOF'].each do |floor|
    ['A','B'].each do |block|
      available << (floor + flat + "-" + block)
    end
  end
end
puts (available - registered)