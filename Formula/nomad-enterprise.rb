# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.6.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.4+ent/nomad_1.6.4+ent_darwin_amd64.zip"
    sha256 "85dac9d7720ef200732c1580a64ea79ed03f94a6cbc904a019c3507761fcc862"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.4+ent/nomad_1.6.4+ent_darwin_arm64.zip"
    sha256 "54e34433e300e4b05954f17ecd782be1821cde880b1819b054c0164333b8d794"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.4+ent/nomad_1.6.4+ent_linux_amd64.zip"
    sha256 "f5900b1d7dd98a567ebb43fa05065b53194e2a062c910517ee3e1849b9a0470e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.4+ent/nomad_1.6.4+ent_linux_arm.zip"
    sha256 "87226786263c401e2f439339a88f1c23e0453e2e17559a7327bea722a589a89c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.4+ent/nomad_1.6.4+ent_linux_arm64.zip"
    sha256 "c6961618c292d80998112679c0c3cdfd8ff32e7cfbb07b859d6927784dd16b6e"
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
