class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.32"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.32/enos_0.0.32_darwin_arm64.zip"
    sha256 "cb6bf99cc11972111ef43743cce9c5d3f6ca797ddadfb77673d8822ec48630a8"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.32/enos_0.0.32_darwin_amd64.zip"
    sha256 "9fa946f3ca1a70cce9cda1684566b9b91645e5cb9ef8dbceaa74eb358ad0263a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.32/enos_0.0.32_linux_arm64.zip"
    sha256 "1a8353f89e3fbf16b7fd745188eaf919437c337e0a7faecffa2bcb251e59dbf0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.32/enos_0.0.32_linux_amd64.zip"
    sha256 "93b6051b659c7f7f24925bd78b4b0c1ff114db5b15b6396f6e5e0db7f71a9938"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
