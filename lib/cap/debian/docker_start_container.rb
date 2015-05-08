module VagrantPlugins
  module UpstartDockerProvisioner
    module Cap
      module Debian
        module DockerStartService
          def self.docker_start_container(machine, config)
            name = config[:name]

            # If the name is the automatically assigned name, then
            # replace the "/" with "-" because "/" is not a valid
            # character for a docker container name.
            name = name.gsub("/", "-") if name == config[:original_name]

            args = "--cidfile=#{config[:cidfile]} "
            args << "-d " if config[:daemonize]
            args << "--name #{name} " if name && config[:auto_assign_name] || config[:auto_restart]
            args << config[:args] if config[:args]
            run_command = "docker run #{args} #{config[:image]} #{config[:cmd]}"
            start_command = "docker start -a #{name}"
            script = <<-SCRIPT
echo "description \\"run container #{name}\\"

start on started #{config[:start_after]}
stop on runlevel [!2345]

respawn

script
  #{start_command} || #{run_command}
end script
" > /etc/init/#{name}.conf
            SCRIPT
            machine.ui.detail("Registering #{name} with upstart")
            machine.communicate.tap do |comm|
              comm.sudo(script)
              comm.sudo("service #{name} start")
            end
          end
        end
      end
    end
  end
end
