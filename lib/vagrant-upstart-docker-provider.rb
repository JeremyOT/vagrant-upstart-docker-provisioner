require "vagrant"

module VagrantPlugins
  module UpstartDockerProvisioner
    class Plugin < Vagrant.plugin("2")
      name "upstartdocker"
      description <<-DESC
      Provides support for provisioning your virtual machines with
      Docker images and containers.
      DESC

      config(:upstartdocker, :provisioner) do
        require_relative "config"
        Config
      end

      guest_capability("debian", "docker_install") do
        require_relative "cap/debian/docker_install"
        Cap::Debian::DockerInstall
      end

      guest_capability("debian", "docker_configure_auto_start") do
        require_relative "cap/debian/docker_configure_auto_start"
        Cap::Debian::DockerConfigureAutoStart
      end

      guest_capability("debian", "docker_start_service") do
        require_relative "cap/debian/docker_start_service"
        Cap::Debian::DockerStartService
      end

      guest_capability("debian", "docker_start_container") do
        require_relative "cap/debian/docker_start_container"
        Cap::Debian::DockerStartService
      end

      guest_capability("redhat", "docker_install") do
        require_relative "cap/redhat/docker_install"
        Cap::Redhat::DockerInstall
      end

      guest_capability("redhat", "docker_configure_auto_start") do
        require_relative "cap/redhat/docker_configure_auto_start"
        Cap::Redhat::DockerConfigureAutoStart
      end

      guest_capability("redhat", "docker_start_service") do
        require_relative "cap/redhat/docker_start_service"
        Cap::Redhat::DockerStartService
      end

      guest_capability("linux", "docker_installed") do
        require_relative "cap/linux/docker_installed"
        Cap::Linux::DockerInstalled
      end

      guest_capability("linux", "docker_configure_vagrant_user") do
        require_relative "cap/linux/docker_configure_vagrant_user"
        Cap::Linux::DockerConfigureVagrantUser
      end

      guest_capability("linux", "docker_daemon_running") do
        require_relative "cap/linux/docker_daemon_running"
        Cap::Linux::DockerDaemonRunning
      end

      provisioner(:upstartdocker) do
        require_relative "provisioner"
        Provisioner
      end
    end
  end
end
