class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.2.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.2.0/consul-terraform-sync_0.2.0_darwin_amd64.zip"
    sha256 "83e2563518015b489081759efbf6297192fbfaf4e67cb6cb6e66b418e9c8adc0"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.2.0/consul-terraform-sync_0.2.0_linux_amd64.zip"
    sha256 "eb9d79c349d95d52fd2e4891cb15a01053c2581c98870ca94e06362678dc46ca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.2.0/consul-terraform-sync_0.2.0_linux_arm.zip"
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
