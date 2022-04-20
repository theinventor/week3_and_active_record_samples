# 999.times do
#   url = "https://www.powderpigs.com/register-your-student/"
#   r = Faraday.get url
#   r.body
#   puts Time.now
#   puts Digest::MD5.hexdigest(r.body)
#   `say it has changed` unless r.body.include? "2023 Registration for returning families"
#   sleep 60.minutes
# end
#
#
