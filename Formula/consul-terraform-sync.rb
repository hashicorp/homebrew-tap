class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.5.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.0/consul-terraform-sync_0.5.0_darwin_amd64.zip"
    sha256 "95076ece14686ad42dc5f9cf21e7d8b08c3351ef742302347b72effe55ed542c"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.0/consul-terraform-sync_0.5.0_linux_amd64.zip"
    sha256 "2bb06f02cb0eb7b2c3fdb4a8e1ee16d413af309c81e8e6d27411dcd121e17a2b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.0/consul-terraform-sync_0.5.0_linux_arm.zip"
    sha256 "08a2042d2ef3bd32774aec1f7bcab2dfd999da9e045509ea4428c822bdb3f390"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
