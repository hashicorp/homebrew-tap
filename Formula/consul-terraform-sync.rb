class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.2.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.2.1/consul-terraform-sync_0.2.1_darwin_amd64.zip"
    sha256 "c901954a59764220220a3b912179c6bbf8de25f3b5928d588dd7c8292d13b5ea"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.2.1/consul-terraform-sync_0.2.1_linux_amd64.zip"
    sha256 "3e673e81097f3b14dcc77e18f4e0291b2083aa21968e094db1605ce1f4978e7a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.2.1/consul-terraform-sync_0.2.1_linux_arm.zip"
    sha256 ""
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
