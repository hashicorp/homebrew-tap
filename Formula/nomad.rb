# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.8.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.0/nomad_1.8.0_darwin_amd64.zip"
    sha256 "7c48f267301191cfb0079b51d2f2a89916424a9f9143ed1ad88fa337fc4f4b15"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.0/nomad_1.8.0_darwin_arm64.zip"
    sha256 "57b4547aa4a937340dd322b7a9cabb238ebb8fd77bdd6f46397e8ebce402bdf0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.0/nomad_1.8.0_linux_amd64.zip"
    sha256 "07a3578b3a928f048d612ccbfe53fd7c2dd81bd34ddcea3954cfa39f311a47f2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.0/nomad_1.8.0_linux_arm.zip"
    sha256 "d159ab15d35a22c985f04bdde9e2ef6a3d3083667027e69425f9480203e3ea83"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.0/nomad_1.8.0_linux_arm64.zip"
    sha256 "fdd3e544e4095ac1dc80d5d414c5df3376526f297365193eb692ff627c4c6c93"
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
