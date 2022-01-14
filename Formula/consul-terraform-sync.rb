class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.4.3"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.3/consul-terraform-sync_0.4.3_darwin_amd64.zip"
    sha256 "1de3a43db4f4dd730e4ca20d216bec0c46f006e56693c0f995429d2c14666a6f"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.3/consul-terraform-sync_0.4.3_linux_amd64.zip"
    sha256 "188d5a950092c9ec819a71b5dfb6f595df8e8e00223d4009752943ba4376adc1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.3/consul-terraform-sync_0.4.3_linux_arm.zip"
    sha256 "3e022eba193a61867b2f30f6f7e6b61d2dea28d2d28bd0662d253790997fd175"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
