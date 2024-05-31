class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.30"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.30/enos_0.0.30_darwin_arm64.zip"
    sha256 "4947c7641cc61ca812047a88b8436d124300a0ee8e201ad1a3302aa5c7c21188"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.30/enos_0.0.30_darwin_amd64.zip"
    sha256 "ffab2a2cc99d1d10f20b3cb38e6c679d56937d146fcd21c24d0574c6b73799d2"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.30/enos_0.0.30_linux_arm64.zip"
    sha256 "4fb202b31778a25ece9f7df14f18de69dbb51e0c7e028c1aaade2e7522e834c9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.30/enos_0.0.30_linux_amd64.zip"
    sha256 "6ac724aaf99094dd34bdb7c631e1f2a89f19b3fe35e97e3109425e72af034d1a"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
