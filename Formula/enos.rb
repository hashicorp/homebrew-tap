class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.31"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.31/enos_0.0.31_darwin_arm64.zip"
    sha256 "89e5d5db94edc45f348055abb5eb015bdf45e21eefce7ae967494e78cee40b4e"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.31/enos_0.0.31_darwin_amd64.zip"
    sha256 "fc378099322dc5240460e3529a9684dcedbb8bf4d57780c33967b1c75da603e4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.31/enos_0.0.31_linux_arm64.zip"
    sha256 "2a39d3d23492071f93d3d0f6b8c97f3a8bcf98da9f021e54263044a320822bf9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.31/enos_0.0.31_linux_amd64.zip"
    sha256 "a121048ff35b2777d217a1290eeb4253da9dd2362821c95fadb13fc5b0a049c2"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
