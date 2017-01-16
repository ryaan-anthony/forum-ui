general_group = Group.find_or_create_by(code: :general) do |group|
  group.code = 'general'
  group.title = 'General Things'
end

lol_group = Group.find_or_create_by(code: :lol) do |group|
  group.code = 'lol'
  group.title = 'LOL'
end

programming_group = Group.find_or_create_by(code: :programming) do |group|
  group.code = 'programming'
  group.title = 'Programming'
end

science_group = Group.find_or_create_by(code: :science) do |group|
  group.code = 'science'
  group.title = 'Science'
end

top_group = Group.find_or_create_by(code: :top) do |group|
  group.code = 'top'
  group.title = 'Top Stories'
end

technology_group = Group.find_or_create_by(code: :technology) do |group|
  group.code = 'technology'
  group.title = 'Technology'
end

us_group = Group.find_or_create_by(code: :us) do |group|
  group.code = 'us'
  group.title = 'U.S.'
end

world_group = Group.find_or_create_by(code: :world) do |group|
  group.code = 'world'
  group.title = 'World'
end

default_links = {
  general_group.id => %w(
    http://i.imgur.com/nLcoOb7.gifv
    http://i.imgur.com/UQpEvIb.gifv
    http://i.imgur.com/H2uBuzn.gifv
  ),
  lol_group.id => %w(
    https://i.redd.it/11s46m0842ay.jpg
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
  top_group.id => %w(
    http://i.imgur.com/Rum0zSz.gifv
    http://i.imgur.com/BPLErFK.gifv
    http://i.imgur.com/gkp04Gc.gifv
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
    Link.find_or_create_by(url: url) do |link|
      link.url = url
      link.group_id = group_id
    end
  end
end


