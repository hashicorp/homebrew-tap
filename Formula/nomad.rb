# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.0.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.2/nomad_2.0.2_darwin_amd64.zip"
    sha256 "f4be7bda3c47a39307a1dac6bc5944bf1461ac1f24a33407e89a9912dd8d23b4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.2/nomad_2.0.2_darwin_arm64.zip"
    sha256 "a93a69b3d283192e43210f14b76f6e86ed9bdf5a85fa03c5b3dc3f7100117d95"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.2/nomad_2.0.2_linux_amd64.zip"
    sha256 "694bbbcec397f994299f1a52fe4b1d9276e08ce8a524af54226eb51b9eceddb8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.2/nomad_2.0.2_linux_arm64.zip"
    sha256 "a7c66ad9bad3093c0a5aa4e845c1eeb8550659a5011eabb5cf7f042d3ab7208b"
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
