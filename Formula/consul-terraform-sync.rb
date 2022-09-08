class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.7.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.0/consul-terraform-sync_0.7.0_darwin_amd64.zip"
    sha256 "270d61b77e99ac7f3e0cddc301ea3eb0c1cffc391edd0ba0822ddc34d70ccee0"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.0/consul-terraform-sync_0.7.0_linux_amd64.zip"
    sha256 "40bcb6fa6ab043cad6c7e2425a723f0531b1539ec2502ac2d6fc44180df1efb4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.7.0/consul-terraform-sync_0.7.0_linux_arm.zip"
    sha256 "25b3b0b220d6ef31f5864d7babeac24c6cfd5e49f25ed773b14a207d2b127e11"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
