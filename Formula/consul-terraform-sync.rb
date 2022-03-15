class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.5.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.2/consul-terraform-sync_0.5.2_darwin_amd64.zip"
    sha256 "b63737821c735dd59efa006d4ff90cb3c89505078b91c3ee2dcd4bab1f7e8833"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.2/consul-terraform-sync_0.5.2_linux_amd64.zip"
    sha256 "3bfe5cb444515a1aa7a6362af956fc656d3063b621f5dffb63a97614059122e4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.2/consul-terraform-sync_0.5.2_linux_arm.zip"
    sha256 "45c0d7b7e9dbb61a6bdd10cdb81b2e23a44db22960af7ccfc94c86222abb5272"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
