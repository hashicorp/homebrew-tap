class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.29"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.29/enos_0.0.29_darwin_arm64.zip"
    sha256 "f83a6a453f4fcba045e84fd66f3c4b59e27707d7f4e87c3f30c5aaafca91e247"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.29/enos_0.0.29_darwin_amd64.zip"
    sha256 "260a1acc7b42262ca0b86fc6b0c047a2f3d824d7a18d3c8cf317cfd05bd0cf9c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.29/enos_0.0.29_linux_arm64.zip"
    sha256 "c9bb161a84bd0cd6d6190c8137378bb853bec614ae002103dd7c212535883c27"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.29/enos_0.0.29_linux_amd64.zip"
    sha256 "c06d3aa840621bde1b1ea553172736361d7a3551a86a7d7bc96b03c92bebfc6c"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
