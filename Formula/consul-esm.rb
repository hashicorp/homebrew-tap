class ConsulEsm < Formula
  desc "Consul ESM"
  homepage "https://github.com/hashicorp/consul-esm"
  version "0.6.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-esm/0.6.0/consul-esm_0.6.0_darwin_amd64.zip"
    sha256 "b48bdaaad25ebea94b57527a813cffb66181b8addbc9aebc24ba3f6c5c50c0d6"
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
    url "https://releases.hashicorp.com/consul-esm/0.6.0/consul-esm_0.6.0_linux_amd64.zip"
    sha256 "161a9df2b69a73e70004aef2908a8fd4cbcd86b3586d892934b3c9e7f6fbea94"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.6.0/consul-esm_0.6.0_linux_arm.zip"
    sha256 "e06abe49992da7efd2421635d2b5d0342ea5d54ed890c0f646058e1dfcd935b9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-esm/0.6.0/consul-esm_0.6.0_linux_arm64.zip"
    sha256 "8a10b4d3337487d4cb6b2f1afdf71a35af2c63bafed6a396b1e5bcd7871d9435"
  end

  conflicts_with "consul-esm"

  def install
    bin.install "consul-esm"
  end

  test do
    system "#{bin}/consul-esm --version"
  end
end
