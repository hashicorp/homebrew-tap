class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.4.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.0/consul-terraform-sync_0.4.0_darwin_amd64.zip"
    sha256 "97ca9b3d036e5b31c2b7bf478ec5798bcc8ee3c12ad6f0cd54e8a0342a7ffbdd"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.0/consul-terraform-sync_0.4.0_linux_amd64.zip"
    sha256 "5d1a44316840caea5cb9d96dbf7666f6aab5a0f975f2b06c09949b565ecbf659"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.0/consul-terraform-sync_0.4.0_linux_arm.zip"
    sha256 "c2f644b1643c647a88ff8aad20f15a4700be2fb88137cbb73c0905864e75c3c2"
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
