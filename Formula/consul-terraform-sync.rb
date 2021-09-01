class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.3.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.3.0/consul-terraform-sync_0.3.0_darwin_amd64.zip"
    sha256 "00d318af26a6ca1cba6e2aa45bff9500dfecfdaba1eeed04fdf689fae536933a"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.3.0/consul-terraform-sync_0.3.0_linux_amd64.zip"
    sha256 "fd5ff2708809b1a14e4650bdc729367be92ecff66aa9baa585195e6335de04b8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.3.0/consul-terraform-sync_0.3.0_linux_arm.zip"
    sha256 "84f43f2f745df55faab66f7974d7dc31d579dfd7af62b5221f9b62517ac68067"
  end

  bottle :unneeded

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
