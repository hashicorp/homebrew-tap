# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_darwin_amd64.zip"
    sha256 "f623878b2893f0fe2587cb2e2edaec1a5606241db03d04725eec2c207130b5b7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_darwin_arm64.zip"
    sha256 "f5b17cb44df0432a90cd765a96bd9be261f2b5cc3095137a6b04f4069bf602e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_linux_amd64.zip"
    sha256 "1d9939232b4700448f64615d352e21619a76f67847933ce8bb106ab182742bb9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_linux_arm.zip"
    sha256 "e4311ff995dd4bbae11c2e88c207aae2b0b5ebd11dd05649d99e62be42f0d84f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.7/nomad_1.7.7_linux_arm64.zip"
    sha256 "e493fb7eac656557f352666ec294dfefd8c887ba4a718b266e84b85064f8258b"
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
