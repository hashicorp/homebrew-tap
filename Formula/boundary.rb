class Boundary < Formula
  desc "Boundary"
  homepage "https://www.boundaryproject.io/"
  version "0.7.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.7.4/boundary_0.7.4_darwin_amd64.zip"
    sha256 "7e4038c0d02e4e581a7c8fa2f62d195fd08c552434d13d3607e51db24035c514"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.7.4/boundary_0.7.4_darwin_arm64.zip"
    sha256 "7971a35c871c2e73dfe0a4e6c17a926e1a43f9bfc11f160611da5339a9cc949b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.7.4/boundary_0.7.4_linux_amd64.zip"
    sha256 "35885c509ebdf7905886d61ad7adcf3f4929d60fc058b29b453a734598c39e2a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.4/boundary_0.7.4_linux_arm.zip"
    sha256 "f3e25637f728763f9890de9baff44eca9298390df0e80a95e82c05ff76c43056"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.7.4/boundary_0.7.4_linux_arm64.zip"
    sha256 "248daf8b263473f886100ccc9cf83bf20c1fb982588b633401e78f0b5e8267f7"
  end

  conflicts_with "boundary"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
