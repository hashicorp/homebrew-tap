# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.4+ent/nomad_1.7.4+ent_darwin_amd64.zip"
    sha256 "22f32f0887cdafd757ee56d1d8de0d133c8ed963f3b3eec84d6840cac289750f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.4+ent/nomad_1.7.4+ent_darwin_arm64.zip"
    sha256 "4edad470b50cd3e8e7a0d47d03691fb9b456117da63b45b623dd0653a4809467"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.4+ent/nomad_1.7.4+ent_linux_amd64.zip"
    sha256 "1140eee2c97e205a5bbff42b6d4e58de1891483336387f8e008d9010c99ac2a3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.4+ent/nomad_1.7.4+ent_linux_arm.zip"
    sha256 "18b8f69b1797de23995a1e00282547bec351d014d9de716b958bc6cf1e002744"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.4+ent/nomad_1.7.4+ent_linux_arm64.zip"
    sha256 "8b07836027aa01d91502e7eba7b36a8b04fbf541730468fb9afe42a805be1a1f"
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
