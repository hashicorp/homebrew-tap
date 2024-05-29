# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.8.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.0+ent/nomad_1.8.0+ent_darwin_amd64.zip"
    sha256 "6da6d7604c3c66c09646d9d3751edae38a8fb6a89ad84925c3148f9732ac7a3e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.0+ent/nomad_1.8.0+ent_darwin_arm64.zip"
    sha256 "ad902b38fda56837259c50325dd6004ebcf8d51301b8e2632ca2d8e6d897abda"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.0+ent/nomad_1.8.0+ent_linux_amd64.zip"
    sha256 "97224c0c5390ff0235d98ecbdc8e93f9b196da8f566617eb02a1c8e59613c253"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.0+ent/nomad_1.8.0+ent_linux_arm.zip"
    sha256 "27526f995ae7d3f0785f72b0efd68eee84c91da99acf73a4678df81868705067"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.0+ent/nomad_1.8.0+ent_linux_arm64.zip"
    sha256 "4a11ea442e46da226ea7e6fde4899e1b186c619822e1894576d05dea667e2630"
  end

  conflicts_with "nomad-enterprise"

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
