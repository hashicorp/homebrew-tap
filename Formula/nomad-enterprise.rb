# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.2+ent/nomad_2.0.2+ent_darwin_amd64.zip"
    sha256 "eaa0a437999cc801b19b13934d92fab3e2ac85884092046b60ede9357d44f96e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.2+ent/nomad_2.0.2+ent_darwin_arm64.zip"
    sha256 "5674cf2c4dc2a88caf69fb0bf25610a267834b956ffbea9ad378c0378d7b4e54"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.2+ent/nomad_2.0.2+ent_linux_amd64.zip"
    sha256 "1c0382288fc9e6757da35b822d2ddc952cbb0c75c060ac093f05a96c353434ba"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.2+ent/nomad_2.0.2+ent_linux_arm64.zip"
    sha256 "539678aa307b8b9b536b3b8adba1617757b9069d3321a32dabcc0df4529f68a4"
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
