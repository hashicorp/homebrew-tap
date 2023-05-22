# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.6+ent/nomad_1.5.6+ent_darwin_amd64.zip"
    sha256 "fb6ec18c453fd63dfc8a4039682c9218b555a47c5f0151cd1e38c2acd02fa718"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.6+ent/nomad_1.5.6+ent_darwin_arm64.zip"
    sha256 "1a8ec16ed3de0b7464a2e23015882af18c8fc55b5904fe6feaf0d8fe6bfa1cc6"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.6+ent/nomad_1.5.6+ent_linux_amd64.zip"
    sha256 "9fa48eb0500ce01b80b538c6639e4dbbc1a8886c4e05ec2cc45c927fce421272"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.6+ent/nomad_1.5.6+ent_linux_arm.zip"
    sha256 "392e3c5739fb50a943cda790866bd638751170efb196b3f8e540dbffe4747ee8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.6+ent/nomad_1.5.6+ent_linux_arm64.zip"
    sha256 "e230a199a47eb481c57331b3aa13a4cc425cab72feee8f1b9843565fd66ee78c"
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
