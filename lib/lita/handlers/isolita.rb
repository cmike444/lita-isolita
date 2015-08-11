module Lita
  module Handlers
    class Isolita < Handler
      route(/^(fuck).*/i, :mind_your_manners)
      route(/^(wake up|get up).*/i, :wake_up)

      def mind_your_manners(response)
        reply_to_name = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"
        response.reply "Mind your manners #{reply_to_name}.."
      end

      def wake_up(response)
        system("heroku ps")
      end
    end

    Lita.register_handler(Isolita)
  end
end
