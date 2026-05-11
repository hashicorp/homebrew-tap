# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.0+ent/nomad_2.0.0+ent_darwin_amd64.zip"
    sha256 "1b119f3dca3f80b8784a5b1c74e3047edc79cda6f29c8ad183793977df7b379a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.0+ent/nomad_2.0.0+ent_darwin_arm64.zip"
    sha256 "cc1667f07a5fb3845ccb30fa9918591fcea9bbef631c76690e1031cb2ead5210"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.0+ent/nomad_2.0.0+ent_linux_amd64.zip"
    sha256 "abdcb1722bd478974352764d0740feb012b5ebd79bdd307edbd470541375b485"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.0+ent/nomad_2.0.0+ent_linux_arm64.zip"
    sha256 "abb94a402cb97c52fda9a4e2a0d3a86fbd58f90ae47cd35936b1887001c0d351"
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
