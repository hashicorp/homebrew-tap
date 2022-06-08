class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.3.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.3.0/hcdiag_0.3.0_darwin_amd64.zip"
    sha256 "ba3ef95d416703398ba3f3b55fff36b387eaaab7502d3e1f932c5d3cdd55417d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.3.0/hcdiag_0.3.0_darwin_arm64.zip"
    sha256 "db755d8cbde9d3b827cd19d3add656562579f063ef0bb7e63ff02dbb7f48935f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.3.0/hcdiag_0.3.0_linux_amd64.zip"
    sha256 "f64d4497ab7abe5907865f3deceebabdb842cd0cac043116e341a764c81841fc"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.3.0/hcdiag_0.3.0_linux_arm.zip"
    sha256 "bd2c4aa21b296c0f88b357ec358dcf4f1f13305bdbe9bb2173471a88262452ff"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.3.0/hcdiag_0.3.0_linux_arm64.zip"
    sha256 "440c80b2d03b56aa66357fc4661a1f369fff8a4d1f3f0fcad1914df378417637"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
