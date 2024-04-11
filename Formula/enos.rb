class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.28"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.28/enos_0.0.28_darwin_arm64.zip"
    sha256 "baba788284fa82ec11bccd1bf9b8e94bae699ad051930dce1fbadeb61ceecac2"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.28/enos_0.0.28_darwin_amd64.zip"
    sha256 "53cf8542d741936960372b4bc3eccc784272ae8f3ffff5760c9eae176c55ff90"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.28/enos_0.0.28_linux_arm64.zip"
    sha256 "7f8fbfe30b20a46b2974b7f8ccb9288cda8fca70ea0a4bd872e8cbd2ce476e3d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.28/enos_0.0.28_linux_amd64.zip"
    sha256 "26b7c88d08d448a3db50cad694af9c357c86d6859ca8927321c0e27d806f264b"
  end

  def install
    bin.install "enos"
  end

  test do
    system "#{bin}/enos --version"
  end
end
