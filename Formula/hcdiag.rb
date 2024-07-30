# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcdiag < Formula
  desc "Hcdiag"
  homepage "https://github.com/hashicorp/hcdiag"
  version "0.5.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.4/hcdiag_0.5.4_darwin_amd64.zip"
    sha256 "db36ddd6ad619840c8295ad375fab4749c52a92397a5cac29c37601f8ce922e6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcdiag/0.5.4/hcdiag_0.5.4_darwin_arm64.zip"
    sha256 "1d0faf988509eb545797c078891945523e52f82a9a99db9c2fc533c174e0fd23"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcdiag/0.5.4/hcdiag_0.5.4_linux_amd64.zip"
    sha256 "162d3a9d8ca586633c85fedaf40ac6baf9b858d4e4c1ce0a4de3b77e03c85854"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.4/hcdiag_0.5.4_linux_arm.zip"
    sha256 "4d615d1f57dbda436925b6a6257428f237d4700016a570d725fcd8426d5f90cc"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcdiag/0.5.4/hcdiag_0.5.4_linux_arm64.zip"
    sha256 "6ff93833a098c0664d74fb3691dcabb13ef158bb66e04b3081362f7ad5213758"
  end

  conflicts_with "hcdiag"

  def install
    bin.install "hcdiag"
  end

  test do
    system "#{bin}/hcdiag --version"
  end
end
