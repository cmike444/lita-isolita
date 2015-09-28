module Lita
  module Handlers
    class Isolita < Handler

      ## Mind your manners will just focus on "Fuck" 
      ## for now until others become a problem.
      route(/fuck/i, :mind_your_manners, help: {
          "lita: fuck you" => "Advises to clean up your language after saying `fuck`"
        })

      def mind_your_manners(response)
        username = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"

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

      route(/^response\s+(.+)/, :data_response, command: true, help: {
        "response" => "Echoes back response data"
        })

      def data_response(response)
        response.reply ">>>#{response.inspect}"
      end


      route(/^echo\s+(.+)/, :echo, command: true, help: {
        "echo TEXT" => "Echoes back TEXT"
        })

      def echo(response)
        response.reply ">>>#{response.matches[0][0]}"
      end

      route(/^get channel\s+(.+)/, :get_channel, command: true, help: {
        "get channel" => "Replies with CHANNEL"
        })

      def get_channel(request, response)
        response.reply "#{request.slack_channel}"
      end

      route(/^take notes\s+(.+)/, :start_live_session, command: true, help: {
        "take notes" => "Starts recording conversation inside channel"
        })

      def start_live_session(request, response)
        username = response.user.metadata['mention_name'].nil? ?
                         "#{response.user.name}" :
                        "#{response.user.metadata['mention_name']}"

        response.reply "Alright, #{username}. It's #{Time.now.strftime('%l:%M')} and I'm ready to take notes."
      end

    end

    Lita.register_handler(Isolita)
  end
end
