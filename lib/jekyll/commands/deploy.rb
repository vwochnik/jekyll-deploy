module Jekyll
  module Commands
    class Deploy < Command
      def self.init_with_program(prog)
        prog.command(:deploy) do |c|
          c.syntax 'deploy'
          c.description 'Deploys the contents of the currently built site.'

          c.action do |args, options|
            $stdout.puts("not yet implemented")
          end
        end
      end
    end
  end
end
