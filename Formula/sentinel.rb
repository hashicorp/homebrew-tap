class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.19.5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.5/sentinel_0.19.5_darwin_amd64.zip"
    sha256 "82ccc2c165c08ea2d870b2755ece4264ec9a8a0cccbf2a054c8e2d4bb4d0fed4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.19.5/sentinel_0.19.5_darwin_arm64.zip"
    sha256 "8758cefe134ec6d82a0144b063f8a59a2cc58a7cb123b74964dab390e12fb84a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.5/sentinel_0.19.5_linux_amd64.zip"
    sha256 "efab84a1466a36144eaa5ce8b9046217d1fe8862423609b3c616fc7fd252703d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.5/sentinel_0.19.5_linux_arm.zip"
    sha256 "a0f1dac8f78c16ca23294e46f0639a4ec663f1ad70c6e16f6588e2ab827283a7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.5/sentinel_0.19.5_linux_arm64.zip"
    sha256 "98fad629ca5c5751dcec963dd28ea9b46f2eb1bd95620c00e2bcbcb6283cd3f8"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
