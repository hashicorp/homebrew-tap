class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.3.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.3.1/hcdiag_0.3.1_darwin_amd64.zip"
    sha256 "644e9e873fbb96bae279afa3acad48a20a98a3deac9a64daf8059b57c94c0356"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.3.1/hcdiag_0.3.1_darwin_arm64.zip"
    sha256 "c81ff6288e41e450bd39b3ecd68334d97400e7394645daa55b7bd4611819643e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.3.1/hcdiag_0.3.1_linux_amd64.zip"
    sha256 "fc1380c847d4f63973fc607a9d913ef619c7ff77cc657d667da2f910aedfd842"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.3.1/hcdiag_0.3.1_linux_arm.zip"
    sha256 "ce990d590811b7887d33222371a917fd923e3a8339234dc8bf55479e3428fe29"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.3.1/hcdiag_0.3.1_linux_arm64.zip"
    sha256 "181a612c0db02300ff2206dfa528b749c4351341fab1d7f0220ef71afe63b6bc"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
