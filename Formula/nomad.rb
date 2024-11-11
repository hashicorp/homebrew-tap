# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_darwin_amd64.zip"
    sha256 "b75b1e907dd30e04912df1bbb53089a48261e636062fd137b9c88c40b0cc4f63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_darwin_arm64.zip"
    sha256 "5c2d1303909df609f8774ca9b2a9c8b5af37fc6a92f0c26cbeae1898c31e1859"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_linux_amd64.zip"
    sha256 "517bce4fcebdc71335ac33a1e34a4c262d2417d8ed4e60cf895fc59e69d70c84"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.3/nomad_1.9.3_linux_arm64.zip"
    sha256 "bd5dd97272c6b4bfeedb2a48c21ae45b2e396c089525003e4e2c8f4b04945da5"
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
