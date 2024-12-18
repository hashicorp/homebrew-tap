# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.4+ent/nomad_1.9.4+ent_darwin_amd64.zip"
    sha256 "3597c3e8dc83115fb1d6ab25761b179bdda348ca29347f6206949fcef07e7c0b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.4+ent/nomad_1.9.4+ent_darwin_arm64.zip"
    sha256 "4b6db762c1f81674cb2eaab401b180e0e147f122ecc977d66fa1cc60be8bb888"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.4+ent/nomad_1.9.4+ent_linux_amd64.zip"
    sha256 "11d4d6f419f372b872d1877e9a794503eebdfc9930c67b4b38f86c9116937c66"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.4+ent/nomad_1.9.4+ent_linux_arm64.zip"
    sha256 "b0ec294f8e156126fe11bd594cb89cc81e22999cb13877568a917027873d7e09"
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
