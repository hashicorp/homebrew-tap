# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.0+ent/nomad_1.9.0+ent_darwin_amd64.zip"
    sha256 "395512da8d83d2232030ade67c648907a754274cbf25c5c1c7de93dd384b2b49"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.0+ent/nomad_1.9.0+ent_darwin_arm64.zip"
    sha256 "d799a960afa259f123c36345768152cec7e5af0afb6d0c0101edb06b2c418c7f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.0+ent/nomad_1.9.0+ent_linux_amd64.zip"
    sha256 "be2ff33294eb2e2cb864a952bec710eb758a4982b75d5c62071458c97d4a29c5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.0+ent/nomad_1.9.0+ent_linux_arm64.zip"
    sha256 "e0932dc3784789e8dc6e94b9f167802fa9e0a7f20a40de645ba8220a844928d6"
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
