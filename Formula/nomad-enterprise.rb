# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.7+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.7+ent/nomad_1.9.7+ent_darwin_amd64.zip"
    sha256 "b50658da680a026857c7c475d38e4920e5fe795d07673fc6cdf6b61c59588f78"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.7+ent/nomad_1.9.7+ent_darwin_arm64.zip"
    sha256 "5e2e40cac124d8268bf5aba4ba3022c25df271880f5a94f1dd6a8e55b00a15b2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.7+ent/nomad_1.9.7+ent_linux_amd64.zip"
    sha256 "caa3625a351f4ee58eae65eea375276ff52c071e7fbca7d140b8c1ae18043e96"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.7+ent/nomad_1.9.7+ent_linux_arm64.zip"
    sha256 "3b21230f595251e52e30b32dff4ec1be674ea785a408ad79756f2e9191fe26dc"
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
