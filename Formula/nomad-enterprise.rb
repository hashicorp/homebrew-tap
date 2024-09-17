# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.8.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.4+ent/nomad_1.8.4+ent_darwin_amd64.zip"
    sha256 "7b2cd2d8d2d6cddbbb625c1c54f6d26b4d0613d03b8d72adafecb3b05420e32f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.4+ent/nomad_1.8.4+ent_darwin_arm64.zip"
    sha256 "32ef1391e1064deea31fe9436d3fd9efba0016f18f8c441f87f3e856284366d9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.4+ent/nomad_1.8.4+ent_linux_amd64.zip"
    sha256 "7881f85a750eddba58ce126dccc734c11eaaa4ce0585ccc9131eaa7ae5551288"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.4+ent/nomad_1.8.4+ent_linux_arm64.zip"
    sha256 "423b0579e1117241602be89081b39fa946ef1b2eb1ee86f10519163e74d875a1"
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
