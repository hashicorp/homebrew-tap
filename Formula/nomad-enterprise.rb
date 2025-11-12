# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.8.18+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.18+ent/nomad_1.8.18+ent_darwin_amd64.zip"
    sha256 "7309f2cc3cc9d2791292be2661333c4fdee6a3ed319a816d383e72edd3322f8d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.18+ent/nomad_1.8.18+ent_darwin_arm64.zip"
    sha256 "e121e4274086e5cabad3a35a772f7a14d77cb746fa087deaa3c14e3050b60c84"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.18+ent/nomad_1.8.18+ent_linux_amd64.zip"
    sha256 "f799c5645d40721afbc43531331feb493f97e38605ecdb27cb3ba11d98d2c50f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.18+ent/nomad_1.8.18+ent_linux_arm64.zip"
    sha256 "592849c82a2123b42ba5e07160d24809cdb230455e4e84072a2754f0b9cd5fe8"
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
