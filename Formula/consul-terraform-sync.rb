class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.6.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.6.0/consul-terraform-sync_0.6.0_darwin_amd64.zip"
    sha256 "bff81465e8c9426fbf3e4192c9544394bda622b2641efa2ed462750d0ec7dd1b"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.6.0/consul-terraform-sync_0.6.0_linux_amd64.zip"
    sha256 "29d70b655e2dce3f92afdd797eabcb5b14a77487739d31daa0ce8b8055f01478"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.6.0/consul-terraform-sync_0.6.0_linux_arm.zip"
    sha256 "956bb2076fa02e3b755b2dc231ac6eca7c34961ce818a5a7e34cf68804924b21"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
