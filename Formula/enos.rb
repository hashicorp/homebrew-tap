class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.34"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.34/enos_0.0.34_darwin_arm64.zip"
    sha256 "c24a5d0871ee9d734102bc6abe8c1e86ab8a03fa28bd7a08e5e49462cdf12fe8"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.34/enos_0.0.34_darwin_amd64.zip"
    sha256 "ec573db1a21f45523d8960ae5b4e7cbd1ed3f3e6b2540b6d28a44494daa7c15f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.34/enos_0.0.34_linux_arm64.zip"
    sha256 "86e38ee8086d299fa88186a6592b7929767e12423dc56039a2f36dba87be2fd7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.34/enos_0.0.34_linux_amd64.zip"
    sha256 "a00bd44212925e16747eb8370ee3ca387cc8fa45bc7371809afa23a9dfa5483c"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
