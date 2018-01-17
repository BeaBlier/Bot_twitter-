require 'twitter'

# Objectif : pouvoir rentrer les clés et token en 1 seule fois et sur une ligne.
input_array = ARGV    #argument de vecteur 
if input_array.length != 4
  puts "Usage: ruby filename.rb [consumer_key] [consumer_secret] [consumer_token] [consumer_token_secret]"
  exit
else
    twitter_consumer_key = ARGV[0].to_s      #convertir en string
    twitter_consumer_secret = ARGV[1].to_s
    twitter_consumer_token = ARGV[2].to_s
    twitter_consumer_token_secret = ARGV[3].to_s
end
bea = Twitter::REST::Client.new do |config|
  config.consumer_key        = twitter_consumer_key
  config.consumer_secret     = twitter_consumer_secret
  config.access_token        = twitter_consumer_token
  config.access_token_secret = twitter_consumer_token_secret
end

# Bot qui envoie un message direct.
target = "@lballoblock"
bea.create_direct_message(target,"Hello you !")

# Bot qui twitte en utilisant une partie de la liste des journalistes.
target=["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap"]
target.each do |pseudo|   #fonction each pour atteindre chaque journaliste
bea.update (" Hey #{target} The Hacking Project vous salue !! ")  #action pour faire un bot twitter.
end
