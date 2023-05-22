# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.5.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_darwin_amd64.zip"
    sha256 "1d9d220a1df37ecacefdb5514908de65f332f4caeaae7936c680a5d89ac6fa62"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_darwin_arm64.zip"
    sha256 "7c89d8c01d4e902f3d91969ad7bf9fc792ed63846caf6f6c602c428cf06d495d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_linux_amd64.zip"
    sha256 "65a7d5a4c6ade01a44292901b05a7c985b4459e0a079b5eb55f5d61474ee98e5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_linux_arm.zip"
    sha256 "087de31ae398985154329235e377e57c006e6b3ac2d1c4e836ea08631205609a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.6/nomad_1.5.6_linux_arm64.zip"
    sha256 "8ad084e33795a520ffd239d58d77146d418d676e7e9484ee1db6975044dc7e19"
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
