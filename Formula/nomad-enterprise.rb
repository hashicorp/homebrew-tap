# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/nomad/1.7.2+ent/nomad_1.7.2+ent_darwin_amd64.zip"
    sha256 "56c529a817fafd38b19787e08fd3ce8fa1dbcb5d07ff91d84bf1695a33305ec6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/nomad/1.7.2+ent/nomad_1.7.2+ent_darwin_arm64.zip"
    sha256 "bfd544c8832458bdff4905e5ff271433c964597bb071c252fd0472d98c70de37"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/nomad/1.7.2+ent/nomad_1.7.2+ent_linux_amd64.zip"
    sha256 "2f597048dc6fe71bfb65b88fc3a4177d86a955a3df9154bd71752270682e1bca"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/nomad/1.7.2+ent/nomad_1.7.2+ent_linux_arm.zip"
    sha256 "6921b84d97c79363625cf9f755aa3ee01867eeed770de026d517da8bb80d5463"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/nomad/1.7.2+ent/nomad_1.7.2+ent_linux_arm64.zip"
    sha256 "93a0f2efede5668427eb91b762bf0a6b42a48261b9a1214a012500f8531d868d"
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
