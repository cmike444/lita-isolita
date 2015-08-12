module Lita
  module Handlers
    class Isolita < Handler

      ## Mind your manners will just focus on "Fuck" 
      ## for now until others become a problem.
      route(/fuck/i, :mind_your_manners, help: {
          "lita: fuck you" => "Advises to clean up your language after saying `fuck`"
        })

      def mind_your_manners(response)
        username = response.user.metadata['name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['name']}"

        mind_manners = [
          "Mind your manners #{username}..",
          "You better wash out that dirty mouth #{username}!",
          "That is just unprofessional, #{username}.",
          "Your mother wouldn't like to hear you say that, #{username}.",
          "Quite the potty mouth on you, #{username}..",
          "Good manners are made up of petty sacrifices, #{username}.",
          "Does saying that make you more mature, #{username}?",
          "Rude."
        ]
        response.reply mind_manners.sample
      end



      route(/^echo\s+(.+)/, :echo, command: true, help: {
        "lita: echo TEXT" => "Echoes back TEXT"
        })

      def echo(response)
        response.reply response.matches.to_s.strip
      end

    end

    Lita.register_handler(Isolita)
  end
end
