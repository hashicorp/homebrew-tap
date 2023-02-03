class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.19.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.3/sentinel_0.19.3_darwin_amd64.zip"
    sha256 "753593f9db0165fb08edbcf49c38d1294f944cedee2a6b3131aba716099f55a5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.19.3/sentinel_0.19.3_darwin_arm64.zip"
    sha256 "86321df611568d59ed7ce4ea9544234c75492f716c4d373567401ab0499ff19e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.3/sentinel_0.19.3_linux_amd64.zip"
    sha256 "42e879a8de29e8d3d3ad756d8123d7015c553c0656540a83b1ef9899935233d2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.3/sentinel_0.19.3_linux_arm.zip"
    sha256 "380a69c64252a8cd6852cce054164fb5366a1e0cecf1d32ff2ba6ca64ddb25d9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.3/sentinel_0.19.3_linux_arm64.zip"
    sha256 "a6df6b032ff0da41810c5ceadaede80663413129d58f35f1a2a558ed999828bb"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
