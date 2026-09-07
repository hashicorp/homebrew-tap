# Copyright IBM Corp. 2020, 2026

class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.37"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.37/enos_0.0.37_darwin_arm64.zip"
    sha256 "8711203256451a08220a9e3bedf7dd1d80a25535c1bbb547110db0bfc08beba0"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.37/enos_0.0.37_darwin_amd64.zip"
    sha256 "b23094b89d897cb5d50ab37bff6f13c2011e246f2308d3b3e8ce6e293462ca31"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.37/enos_0.0.37_linux_arm64.zip"
    sha256 "7676304ded5da88d82152498ed560bc1d57f680d8e87d054763157aaccf8b065"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.37/enos_0.0.37_linux_amd64.zip"
    sha256 "b26bbcb02bef1f69084088e178c67b9bb3c1b6a04c0df447ae580584fb2dd7dd"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
