class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.12"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.12/sentinel_0.18.12_darwin_amd64.zip"
    sha256 "83332a987aa9c9bb8be5e6bc13344eec60b8d4060067b8ad4c67aa65fca92de0"
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
    url "https://releases.hashicorp.com/sentinel/0.18.12/sentinel_0.18.12_linux_amd64.zip"
    sha256 "c205ca51850bdd6dd00d076eeb61fffd2b78cf6501b69261a11eb6f9a099a769"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.12/sentinel_0.18.12_linux_arm.zip"
    sha256 "f361b386eea299b15b11c95e10837c421b863dd3ef47ed885a9a6a2988e77e10"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.12/sentinel_0.18.12_linux_arm64.zip"
    sha256 "07f13731d9c0a38082ba31935015f8f33ac44931aebcd65dde5e78e1f2fee173"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
