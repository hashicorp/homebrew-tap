# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.0.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.4/nomad_2.0.4_darwin_amd64.zip"
    sha256 "65546d1d273723fd347c113dc8b59c695e28d6615d6e3bd7df6d6ee6ef7e9aee"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.4/nomad_2.0.4_darwin_arm64.zip"
    sha256 "ddd9fa6b632f27604f65bf1efe82f9f25f5d7bd49b204a10b5a97c8786595801"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.4/nomad_2.0.4_linux_amd64.zip"
    sha256 "f6b0d555f65de7d81ef3274d7d7dfcad6ff24d6e6214a806deb5c50b909e47b7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.4/nomad_2.0.4_linux_arm64.zip"
    sha256 "406354fcc7cb77d6169cdfec13dc15cd440dd6486f88d10d28c1d3b17a254bea"
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
