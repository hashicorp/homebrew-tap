class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.0/hcdiag_0.5.0_darwin_amd64.zip"
    sha256 "45af5309452e4e1d4825443fd3b0bac323a2bd537b99c4699f042293d903e196"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.0/hcdiag_0.5.0_darwin_arm64.zip"
    sha256 "af3f20ecdae8520ad1dd70c9bbf5f401586792e47ede96fc029f1aa6004fc10e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.0/hcdiag_0.5.0_linux_amd64.zip"
    sha256 "7018aee21abe73a87860e651cbc7b2e34d353a855388d4156583fa59f9f694a4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.0/hcdiag_0.5.0_linux_arm.zip"
    sha256 "809af34fe245df7aa3c3df7ed5104fb6e6c2c7891fb09c66426ba445ae46c034"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.0/hcdiag_0.5.0_linux_arm64.zip"
    sha256 "a9f9abf6c40639ed4fe6480da404558f0587462c00d829c08de8e3ac8e6a7e68"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
