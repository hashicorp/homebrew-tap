class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.13.0"

  if OS.mac?
    url "https://releases.hashicorp.com/envconsul/0.13.0/envconsul_0.13.0_darwin_amd64.zip"
    sha256 "766b41be96f0829ed15de3f4e6c5e2b8bc89709794ad174f36524522282acbee"
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
    url "https://releases.hashicorp.com/envconsul/0.13.0/envconsul_0.13.0_linux_amd64.zip"
    sha256 "1db7fa993d4e6182eab10d17210e36b94848799ed4dd75582bf642260af3db53"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.0/envconsul_0.13.0_linux_arm.zip"
    sha256 "4b368b5b137562f8cf8eba74cb04d639bbbfd5a307cad9daabf23aa51dba6d24"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.0/envconsul_0.13.0_linux_arm64.zip"
    sha256 "6c8e489076ec1180018c1ac2630019657cb2cec298d025065e45d5d94105742d"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
