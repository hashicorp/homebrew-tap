# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.4+ent/nomad_1.10.4+ent_darwin_amd64.zip"
    sha256 "5274d22958c84297dc9b6e85184bd2aec1a7ec3354ea42ba61332a9866142030"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.4+ent/nomad_1.10.4+ent_darwin_arm64.zip"
    sha256 "ff113321f26a6f9a92a486d309e949bfcb450e48e8d21c168e782a71f7175e78"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.4+ent/nomad_1.10.4+ent_linux_amd64.zip"
    sha256 "014f9ad4a144104974da4f55e5ebc85357d15fbe0fe2bf710f406310efb0e337"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.4+ent/nomad_1.10.4+ent_linux_arm64.zip"
    sha256 "f75c25cf05ac8d85b73ba2f468e6a9608754d2d95c29cf526522ca7b341fdbc2"
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
