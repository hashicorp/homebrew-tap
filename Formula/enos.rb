class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.35"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.35/enos_0.0.35_darwin_arm64.zip"
    sha256 "c172ca0ad95182447269839cb1e0ae46dd7d21d36277d05a1973bcfa9ff929ad"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.35/enos_0.0.35_darwin_amd64.zip"
    sha256 "6802bf87c6a2b3d6fd5859abefe5320f1f0978a6dc85c68d85c87d06d8760668"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.35/enos_0.0.35_linux_arm64.zip"
    sha256 "478a9cf28e74cd78cf8d1ffe0676d752b29ecb14f5d4abcf9f91ac42190bc853"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.35/enos_0.0.35_linux_amd64.zip"
    sha256 "d4a25c24a1f7b361a5f7a532a9bc45e0cab1caf59369e7b0e07a97c51318d3b5"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
