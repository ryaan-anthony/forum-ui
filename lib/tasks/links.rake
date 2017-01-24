namespace :links do
  desc 'Upload links from reddit'
  task reddit: :environment do
    json = JSON.parse(RestClient.get('https://www.reddit.com/r/all/.json').body)
    json['data']['children'].each do |obj| next unless obj['data']['url']
    begin
      puts obj['data']['url']
      link = Link.new(url: obj['data']['url'], author_id: 1)
      link.save
    rescue Errors::InvalidLinkError
      # do nothing
      puts "failed"
    end
    end
  end
end
