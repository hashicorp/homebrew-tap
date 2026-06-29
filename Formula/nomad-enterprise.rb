# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.3+ent/nomad_2.0.3+ent_darwin_amd64.zip"
    sha256 "e9fc5041e0ee2f3a832c7eb07c6b216c6e73dda2ab07ead3993042891d9387f7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.3+ent/nomad_2.0.3+ent_darwin_arm64.zip"
    sha256 "1c3821c109a040aac4ecdd0d39231820d16a4c67a6e0d7f02cab7475d45ba1bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.3+ent/nomad_2.0.3+ent_linux_amd64.zip"
    sha256 "4ac35c90761f8f83987ae2ab2af56848712dca3eebd6a78605cbcaad9e89e8ff"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.3+ent/nomad_2.0.3+ent_linux_arm64.zip"
    sha256 "8e6853740dca9ae3034221223fa19f8d93e8d05edb4a3843cac48f015d6538ac"
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
