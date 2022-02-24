class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.5.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.1/consul-terraform-sync_0.5.1_darwin_amd64.zip"
    sha256 "b9ce44d0826202a71d8db1e9f70eaa4f1fcd788afd35402f4d15bf0a2d5fa367"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.1/consul-terraform-sync_0.5.1_linux_amd64.zip"
    sha256 "391389d674acee98fa3232ea39df0597622b45408a831f8a0d168cd9b22ffa32"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.5.1/consul-terraform-sync_0.5.1_linux_arm.zip"
    sha256 "7b17588e1a3fe3a130278d423a897a238f0fda32382b95576145c51ebbac9536"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
