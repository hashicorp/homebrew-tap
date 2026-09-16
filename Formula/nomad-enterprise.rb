# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.5+ent/nomad_2.0.5+ent_darwin_amd64.zip"
    sha256 "4d8050051c48ab91d7e281691e67ab173ffc4ee87ae913c442cb80588f87c951"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.5+ent/nomad_2.0.5+ent_darwin_arm64.zip"
    sha256 "9d50beb8ffc63fcdfb27c082facfbf64dc25086b8ae26e1c98f877ea09334185"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.5+ent/nomad_2.0.5+ent_linux_amd64.zip"
    sha256 "37e51fee58d2f7c88ec9e38c9e61a6c0ad4c91a2370ea798427f50991f7cd3ab"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.5+ent/nomad_2.0.5+ent_linux_arm64.zip"
    sha256 "cf66d9346b4e034b2b7fcb14d763612dea6d993a9743c4fa4cf84191e3827a3a"
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
