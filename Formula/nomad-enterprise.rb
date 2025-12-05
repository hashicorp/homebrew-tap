# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.11.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.0+ent/nomad_1.11.0+ent_darwin_amd64.zip"
    sha256 "bdd3276045e6c63ed69dbf39ba637d707af2a2068ffc69478b019680db454eb5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.0+ent/nomad_1.11.0+ent_darwin_arm64.zip"
    sha256 "e666abf30254b841329f5b30ab157627088bd549028a88578e84ea63749dc5f4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.0+ent/nomad_1.11.0+ent_linux_amd64.zip"
    sha256 "c73d2f41a14e0fbe4466cbf6d2dfb19f8d7120e91649418a9ea7250e39c96f14"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.0+ent/nomad_1.11.0+ent_linux_arm64.zip"
    sha256 "92f984272aa456667d35a91ba5046b91395fc63e995fed4245b15bdb34c019ec"
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
