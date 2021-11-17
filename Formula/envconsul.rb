class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.12.1"

  if OS.mac?
    url "https://releases.hashicorp.com/envconsul/0.12.1/envconsul_0.12.1_darwin_amd64.zip"
    sha256 "3af57321fcc21a637f2e9057b884d8f4f0c6e1e2167be1e8c5eee8d224dc301d"
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
    url "https://releases.hashicorp.com/envconsul/0.12.1/envconsul_0.12.1_linux_amd64.zip"
    sha256 "361628aada03816d25ff13f4a0938953beda57f3a4ccd60e4278343762b95f6a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.12.1/envconsul_0.12.1_linux_arm.zip"
    sha256 "2731dff7a8b705a8956e3b6eeff944ae78a4792e300b36decfb06a96a24b3a85"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.12.1/envconsul_0.12.1_linux_arm64.zip"
    sha256 "9173100810f71af462321aa35881551a90c614c45508718288348f72617ad32e"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
