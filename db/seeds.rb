
gifs_group = Group.find_or_create_by(title: 'Gifs') do |group|
  group.title = 'Gifs'
end

programming_group = Group.find_or_create_by(title: 'Programming') do |group|
  group.title = 'Programming'
end

science_group = Group.find_or_create_by(title: 'Science') do |group|
  group.title = 'Science'
end

shopping_group = Group.find_or_create_by(title: 'Shopping') do |group|
  group.title = 'Shopping'
end

technology_group = Group.find_or_create_by(title: 'Technology') do |group|
  group.title = 'Technology'
end

us_group = Group.find_or_create_by(title: 'U.S.') do |group|
  group.title = 'U.S.'
end

world_group = Group.find_or_create_by(title: 'World') do |group|
  group.title = 'World'
end

default_links = {
  gifs_group.id => %w(
    http://i.imgur.com/Rum0zSz.gifv
    http://i.imgur.com/BPLErFK.gifv
    http://i.imgur.com/gkp04Gc.gifv
    http://i.imgur.com/nLcoOb7.gifv
    http://i.imgur.com/UQpEvIb.gifv
    http://i.imgur.com/H2uBuzn.gifv
    http://i.imgur.com/2OU6BLS.gif
    http://i.imgur.com/h80nOpy.gifv
  ),
  programming_group.id => %w(
    https://jeena.net/why-i-switchedfrom-osx-to-linux
    https://github.com/minimaxir/big-list-of-naughty-strings
    https://blog.ycombinator.com/vr/
    https://youexec.com/dev/2017/1/14/google-facebook-ads-traffic-is-useless
  ),
  science_group.id => %w(
    https://www.researchgate.net/blog/post/why-do-killer-whales-go-through-menopause
    https://medicalxpress.com/news/2016-12-explanation-people-hard-eye-contact.html
    http://news.nationalgeographic.com/2016/12/supervolcano-campi-flegrei-stirs-under-naples-italy/
    https://medicalxpress.com/news/2017-01-association-hot-peppers-decreased-mortality.html
  ),
  shopping_group.id => %w(
    https://www.amazon.com/gp/product/B007AHHP2W/
    http://www.homedepot.com/p/Husky-SAE-Flex-Ratcheting-Combination-Wrench-Set-5-Piece-HFRW5PCSAE/202934579
    https://www.wayfair.com/Forty-West-Gage-20.5-Table-Lamp-70005-LSWP1079.html
  ),
  technology_group.id => %w(
    https://www.techdirt.com/articles/20161220/12411836320/company-bricks-users-software-after-he-posts-negative-review.shtml
    http://arstechnica.com/tech-policy/2016/12/fcc-republicans-vow-to-gut-net-neutrality-rules-as-soon-as-possible/
    https://www.engadget.com/2017/01/09/report-fbi-arrests-volkswagen-executive-over-dieselgate/
    http://www.recode.net/2016/12/20/14026396/7-eleven-drone-delivery-flirtey-first-retail-us-reno-nevada
  ),
  us_group.id => %w(
    http://www.foxnews.com/us/2017/01/16/fbi-reportedly-arrests-wife-orlando-nightclub-killer-omar-mateen.html
    http://www.usatoday.com/story/news/nation-now/2017/01/15/fbi-most-wanted-fugitive-arrested-el-paso/96617392/
    http://www.whio.com/news/national/watch-massive-gator-spotted-florida-reserve/hGicRnlLMAb3gfN8gc2bHJ/
  ),
  world_group.id => %w(
    http://www.independent.co.uk/news/world/europe/russia-cigarette-sale-ban-anyone-born-after-2015-tobacco-lung-disease-cancer-health-ministry-a7518691.html
    https://sg.news.yahoo.com/pope-tells-women-feel-free-breastfeed-church-001006083.html
    http://www.wyff4.com/article/philippines-will-offer-free-birth-control-to-6-million-women/8586615
  )
}
default_links.each do |group_id, links|
  links.each do |url|
    begin
      link = Link.new(url: url, group_id:group_id)
      link.save
    rescue Errors::InvalidLinkError
      # do nothing
    end
  end
end


