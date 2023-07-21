# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.6.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.1/nomad_1.6.1_darwin_amd64.zip"
    sha256 "9871973c76b29af7115b6fc3f103cc968aa0680cbe3aceffa4ca3af258c5b2ac"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.1/nomad_1.6.1_darwin_arm64.zip"
    sha256 "f44a8111d542ea9e928e2efbcc11c416ed08a86ced48df3067ff73d56d120cb4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.1/nomad_1.6.1_linux_amd64.zip"
    sha256 "e4c01c51c393b266aee4ff184dd97704ae3d838c233a6189425a9f1c31a55f4f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.1/nomad_1.6.1_linux_arm.zip"
    sha256 "447174c812b7d3137580867bd2fa6242b69e2577bf83c2d83a2af96a459b9651"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.1/nomad_1.6.1_linux_arm64.zip"
    sha256 "67b2b2b62cee102f7436391588f67440d44737b75c3d29dfebec94948928374d"
  end

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
