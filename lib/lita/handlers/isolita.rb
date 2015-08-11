module Lita
  module Handlers
    class Isolita < Handler
      route(/^(fuck).*/i, :mind_your_manners)

      def mind_your_manners(response)
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
        replies = [
          "Mind your manners #{reply_to_name}..",
          "You better wash out that dirty mouth #{reply_to_name}!",
          "That is just unprofessional, #{reply_to_name}.",
          "Your mother wouldn't like to hear you say that, #{reply_to_name}."
        ]
        response.reply replies.sample
      end

    end

    Lita.register_handler(Isolita)
  end
end
