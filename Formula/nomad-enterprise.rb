# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.10.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.2+ent/nomad_1.10.2+ent_darwin_amd64.zip"
    sha256 "56748c365cdcb98ef66e50242517d5720362c9a9febf2d96dcde2618e8af9974"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.10.2+ent/nomad_1.10.2+ent_darwin_arm64.zip"
    sha256 "8dee85c38521077f563859691488e256ca8d5b862a4820cf088373fb6bb61939"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.10.2+ent/nomad_1.10.2+ent_linux_amd64.zip"
    sha256 "c125615b30ea3e907c312f2dff9ddaee7326e067ba7b6dddfb4a71f9415c9a79"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.10.2+ent/nomad_1.10.2+ent_linux_arm64.zip"
    sha256 "cfd63decd2f8079147fe3f9900293fc46a26704325160ade5d8dfa6ed5d0de35"
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
