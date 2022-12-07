class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.19.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.0/sentinel_0.19.0_darwin_amd64.zip"
    sha256 "cb28d3b2a3a0940088a8fb693399609418a03abb11606cf75f995b50372df8b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.19.0/sentinel_0.19.0_darwin_arm64.zip"
    sha256 "7a22f0a016522df9e0c84743521a899be05d76bff8f0d522820b5cf1935fe135"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.19.0/sentinel_0.19.0_linux_amd64.zip"
    sha256 "4f152b82427f413b60bb04704c06a5220a36b1ea68056c0989e8fa91d54ee135"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.0/sentinel_0.19.0_linux_arm.zip"
    sha256 "4ef85102e34833df7f563c067c28ccbe98d56f64dcc8b0625b1b05dc4cee4496"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.19.0/sentinel_0.19.0_linux_arm64.zip"
    sha256 "59ad61a90a0bb88796b1bea8e4ce68babd9bb39959a445ecf91b63967a4f1bc4"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
