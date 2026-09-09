# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.6+ent/nomad_2.0.6+ent_darwin_amd64.zip"
    sha256 "e7d300bfba063e09e6185e30822adf217d27657c81e6a1756fb62c098052735e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.6+ent/nomad_2.0.6+ent_darwin_arm64.zip"
    sha256 "6d7b323d5ca8069ab2011c4231c0e8a76bbbeff6de17da81d71970d535ba43dd"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.6+ent/nomad_2.0.6+ent_linux_amd64.zip"
    sha256 "64dd2f9a6a99063ef56e7b94ac234a3166d7be178d3a5f83e8292427d2fd8c84"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.6+ent/nomad_2.0.6+ent_linux_arm64.zip"
    sha256 "70c598c1b03e7da0296ba87adbf16e296514870244696a675f84f7d145d74330"
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
