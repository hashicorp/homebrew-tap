# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.14.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.14.1/envconsul_0.14.1_darwin_amd64.zip"
    sha256 "5753301d22c69c4920b8f1c65d2a33275a1477d6e485391c0a38b09c5845e310"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/envconsul/0.14.1/envconsul_0.14.1_darwin_arm64.zip"
    sha256 "c447ad7993ae9fec5d99c6b32515d3ad0bc3f27ccb9bb81d6c882592e9a03ceb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.14.1/envconsul_0.14.1_linux_amd64.zip"
    sha256 "e975c6628207d4efc08ad218664357197da7098b928c1c21fdce1b4a694aea4c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.14.1/envconsul_0.14.1_linux_arm.zip"
    sha256 "e45719f2263661839a58afb6cffb9da65ff1658bba0bb1e4aac8a156c4142e8e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.14.1/envconsul_0.14.1_linux_arm64.zip"
    sha256 "92544657444a36883bf36fe0b81b4aa826a6ff65532d72186f6aff5eba8561dd"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
