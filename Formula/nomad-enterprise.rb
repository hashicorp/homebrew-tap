# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.6.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.1+ent/nomad_1.6.1+ent_darwin_amd64.zip"
    sha256 "278f99b2492d0e8af4d5a1fbcb20141e86ccab733596319c9649102ecd36abe5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.1+ent/nomad_1.6.1+ent_darwin_arm64.zip"
    sha256 "3fe0f9425cd97771c301718232d6b656b8a9634bae15fd6a939bc800247d8d07"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.1+ent/nomad_1.6.1+ent_linux_amd64.zip"
    sha256 "ed863c3813564b8a2d4cea95d8be7ea612e31e469f65c29c7c6a5456007962a2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.1+ent/nomad_1.6.1+ent_linux_arm.zip"
    sha256 "2c4f0b56bd7c0e67496f9aa0bc86fd6c058f17864f50928e1c6c7ec1b189cea7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.1+ent/nomad_1.6.1+ent_linux_arm64.zip"
    sha256 "3c1ac9955a82abd8791281fe70f8f76d4fcd0b5e0a852e3832800462a8a5f13b"
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
