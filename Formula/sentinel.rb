class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.18.10"

  if OS.mac?
    url "https://releases.hashicorp.com/sentinel/0.18.10/sentinel_0.18.10_darwin_amd64.zip"
    sha256 "c79d982cf24bbce38bcdbf7deb752ff629d76bba33c9f2b04f48be957113885d"
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
    url "https://releases.hashicorp.com/sentinel/0.18.10/sentinel_0.18.10_linux_amd64.zip"
    sha256 "31fb780c1577c0ee12f2f2824cd33663a7e17671f5667293f72f33a23448d7ba"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.10/sentinel_0.18.10_linux_arm.zip"
    sha256 "dd7406a37c90528bf0bb3d4052df6c9d8c37dd7497a788e3e6ee4b80b6a240ba"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.18.10/sentinel_0.18.10_linux_arm64.zip"
    sha256 "a828598dde8f662cbb788eca50b16bc0add5d3982524baa92fb5efe54b9cf500"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
