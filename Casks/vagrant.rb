cask "hashicorp-vagrant" do
  version "2.3.3"
  sha256 ""

  url "https://releases.hashicorp.com/vagrant/#{version}/vagrant_#{version}_darwin_amd64.dmg", 
      verified: "hashicorp.com/vagrant/"
  name "Vagrant"
  desc "Development environment"
  homepage "https://www.vagrantup.com/"

  livecheck do
    url "https://github.com/hashicorp/vagrant"
    strategy :git
  end

  app ""
  pkg "vagrant.pkg"

  uninstall script: {
            executable: "uninstall.tool",
            input: ["Yes"], 
            sudo:  true,
      }, 
      pkgutil: "com.vagrant.vagrant
  
  zap trash: "~/.vagrant.d"
end
