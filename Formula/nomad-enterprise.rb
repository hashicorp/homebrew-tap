# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.8.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.3+ent/nomad_1.8.3+ent_darwin_amd64.zip"
    sha256 "99273d5e5b1b441988e2d1359b1621e0b913e065d0a04d527e469ea4a062c32a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.3+ent/nomad_1.8.3+ent_darwin_arm64.zip"
    sha256 "2fcaf7a9ccb53e46c165e8d4a9185ecda388109989a2b4ecdea267212a645d8a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.3+ent/nomad_1.8.3+ent_linux_amd64.zip"
    sha256 "41581b39758b89187e09d0b818aaabcf0fc9a54cc0aae78b751818ee5f349ee4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.3+ent/nomad_1.8.3+ent_linux_arm64.zip"
    sha256 "594c67c441638720e08b3ac47b14e456cc386aed541c82357c0b5aae65768af8"
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
