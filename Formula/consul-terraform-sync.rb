class ConsulTerraformSync < Formula
  desc "Consul Terraform Sync"
  homepage "https://github.com/hashicorp/consul-terraform-sync"
  version "0.4.1"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.1/consul-terraform-sync_0.4.1_darwin_amd64.zip"
    sha256 "a8da53a56b12f09e62c348d559aa9e6c44095e29363bd7f3335732526367fc40"
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
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.1/consul-terraform-sync_0.4.1_linux_amd64.zip"
    sha256 "1b6320db46a17eff1cb0bade2ebe00138135c58fde05db6d63617a62f5e10abc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-terraform-sync/0.4.1/consul-terraform-sync_0.4.1_linux_arm.zip"
    sha256 "f112e1779c8df7453136196644c41f86a1e93cbe553c83434ec0b7aa877e514a"
  end

  conflicts_with "consul-terraform-sync"

  def install
    bin.install "consul-terraform-sync"
  end

  test do
    system "#{bin}/consul-terraform-sync --version"
  end
end
