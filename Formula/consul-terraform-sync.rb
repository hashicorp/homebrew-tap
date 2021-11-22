class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.4.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.2/consul-terraform-sync_0.4.2_darwin_amd64.zip"
    sha256 "4c70544cb0897597da4e301e2d47eac9dadbeaf19b92e21f1c8a69f99f83f4c9"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.2/consul-terraform-sync_0.4.2_linux_amd64.zip"
    sha256 "c2846ad851aa10c2d1945ebf78e4fa9990e5b3c99ef0b8a6241648e0484262c1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.2/consul-terraform-sync_0.4.2_linux_arm.zip"
    sha256 "c60c2283572b4f7a90b5ef2dd29a1bf552fc7dc2e1bd0060477ff8ececf2c326"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
