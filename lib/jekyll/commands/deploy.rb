require 'open3'

module Jekyll
  module Commands
    class Deploy < Command

      class << self

        def init_with_program(prog)
          prog.command(:deploy) do |c|
            c.syntax 'deploy'
            c.description 'Deploys the contents of the currently built site.'
            c.option 'config',  '--config CONFIG_FILE[,CONFIG_FILE2,...]', Array, 'Custom configuration file'
            c.option 'destination', '-d', '--destination DESTINATION', 'The current folder will be generated into DESTINATION'
            c.option 'verbose', '-V', '--verbose', 'Print verbose output.'
            c.alias :d

            c.action do |args, options|
              Jekyll::Commands::Deploy.process(options)
            end
          end

          def process(options)
            # Adjust verbosity quickly
            Jekyll.logger.adjust_verbosity(options)

            options = configuration_from_options(options)

            deploy = options.fetch('deploy', [])
            if !deploy.is_a?(Array) || !deploy.all? { |d| d.is_a?(String) }
              Jekyll.logger.error "Invalid deploy options."
            elsif deploy.length == 0
              Jekyll.logger.error "No deploy commands specified."
            else
              Jekyll.logger.info "Working directory:", options['destination']
              deploy.each do |command|
                unless execute(command, options['destination'])
                  Jekyll.logger.error "Deploy aborted."
                  break
                end
              end
            end
          end

          def execute(command, directory)
            t = Time.now
            Jekyll.logger.info "Executing '#{command}'..."
            output, status = Open3.capture2(command, :chdir => directory)
            output.each_line { |line| Jekyll.logger.debug line.chomp }
            if status.success?
              Jekyll.logger.info "", "done in #{(Time.now - t).round(3)} seconds."
            else
              if status.exited?
                Jekyll.logger.error "", "failed with status code #{status.exitstatus} in #{(Time.now - t).round(3)} seconds."
              else
                Jekyll.logger.error "", "aborted in #{(Time.now - t).round(3)} seconds."
              end
            end
            status.success?
          end
        end

      end # end of class << self

    end
  end
end
