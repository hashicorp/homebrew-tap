# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.11.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.2+ent/nomad_1.11.2+ent_darwin_amd64.zip"
    sha256 "265f1122fcc8c7309cbfb79fce43c27b5a788b7175b34e2d0f5b095f1e3a34b8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.2+ent/nomad_1.11.2+ent_darwin_arm64.zip"
    sha256 "36fc902dc6266c9eaa55d2ed30dfcfaee19db0d9194600174a08d4db49b8709f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.2+ent/nomad_1.11.2+ent_linux_amd64.zip"
    sha256 "01bffe045bf3ea512ddc841e0636254c027dc63600b64e0354a2ec0c2c2a6229"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.2+ent/nomad_1.11.2+ent_linux_arm64.zip"
    sha256 "2bebea85244bce5c43b743389d70f9a7210ba9fd6ea22d0be410a10a4d723ae2"
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
