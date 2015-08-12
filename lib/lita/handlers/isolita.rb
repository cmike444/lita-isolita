module Lita
  module Handlers
    class Isolita < Handler
      route(/^(fuck).*/i, :mind_your_manners, help: {
          "Fuck you" => "Advises to clean up your language."
        })

      def mind_your_manners(response)
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
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

      route(/^(show response json).*/i, :print_reply, help: {
        "show response json" => "Prints out bot response in json"
        })

      def print_reply(response)
        response.reply_privately response
      end

    end

    Lita.register_handler(Isolita)
  end
end
