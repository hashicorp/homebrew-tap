# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.3+ent/nomad_1.5.3+ent_darwin_amd64.zip"
    sha256 "a0213ae81a5bb3426d2da6da13a53cf3e4cc8c541f673baae89b54607c090f68"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.3+ent/nomad_1.5.3+ent_darwin_arm64.zip"
    sha256 "6165da38d3781f33a2ae971f591ded1d47b0dd2bd1598961967193e66d1280bb"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.3+ent/nomad_1.5.3+ent_linux_amd64.zip"
    sha256 "9db475a373e8afe977d34fc72723c6603b02a05d2dc8b5447c14696e0a2cb592"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.3+ent/nomad_1.5.3+ent_linux_arm.zip"
    sha256 "8054446e3e357413d360b448999b76ba660f3bae9fe2e91c1753b32697f600ae"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.3+ent/nomad_1.5.3+ent_linux_arm64.zip"
    sha256 "38165465e70c970d303bb6adaaddf8d66a519aaed126ae21074ad1bc50612015"
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
