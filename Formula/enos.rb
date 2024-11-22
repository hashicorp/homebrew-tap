class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.33"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.33/enos_0.0.33_darwin_arm64.zip"
    sha256 "3562a6751c33ed1b2e6af5131c7b47b98018336ce6f0df51651263b2c1ac262c"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.33/enos_0.0.33_darwin_amd64.zip"
    sha256 "30384eb2a0e9d49018493fbb986637f68b45092176d933ce28c1643018eb4c59"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.33/enos_0.0.33_linux_arm64.zip"
    sha256 "21c955ec28ccb71aacad8556c314fff6d6f1b7bd16b5e3d43841c6b1cfa50e47"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.33/enos_0.0.33_linux_amd64.zip"
    sha256 "74c1a2f3bbeafc449362c500690637310d2194f1f19954c5ea0c94236a332ff2"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
