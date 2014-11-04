require "vagrant"

module VagrantPlugins
  module GuestSMBShare
    class Plugin < Vagrant.plugin("2")
      name "DSC"
      description <<-DESC
        Provides support for provisioning your virtual machines with
        DSC either using a local `DSC` Configuration or a DSC server.
      DESC

      guest_capability("windows", "create_smb_share") do
        require_relative "cap/create_smb_share"
        Cap::CreateSMBShare
      end

    end
  end
end