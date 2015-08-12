module Lita
  module Handlers
    class Isolita < Handler

      ## Get the username for who's talking to Lita.
      def get_reply_to_name(response)
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
      end


      ## Mind your manners will just focus on "Fuck" 
      ## for now until others become a problem.
      route(/fuck/i, :mind_your_manners, help: {
          "lita: fuck you" => "Advises to clean up your language after saying `fuck`"
        })

      def mind_your_manners(response)
        get_reply_to_name(response)

        mind_manners = [
          "Mind your manners #{reply_to_name}..",
          "You better wash out that dirty mouth #{reply_to_name}!",
          "That is just unprofessional, #{reply_to_name}.",
          "Your mother wouldn't like to hear you say that, #{reply_to_name}.",
          "Quite the potty mouth on you, #{reply_to_name}..",
          "Good manners are made up of petty sacrifices, #{reply_to_name}.",
          "Does saying that make you more mature, #{reply_to_name}?",
          "Rude."
        ]
        response.reply mind_manners.sample
      end



      route(/^(show request).*/i, :print_response, help: {
        "lita: show request" => "Prints out user's request"
        })

      def print_response(response)
        response.reply_privately "#{response.message.inspect}\n#{response.user.inspect}"
      end

    end

    Lita.register_handler(Isolita)
  end
end
