# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.1+ent/nomad_2.0.1+ent_darwin_amd64.zip"
    sha256 "16ca29f807006e51b89e5417ebb4462c5a56540f05df9cc89834d98d61e6220d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.1+ent/nomad_2.0.1+ent_darwin_arm64.zip"
    sha256 "8586d61229dbad9802b0db01a5025c3186e8456485b6b95ca1f3a9d93962a14c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.1+ent/nomad_2.0.1+ent_linux_amd64.zip"
    sha256 "0d19def5b89f5146569ba68e40efd977b980c7fabd3964ddc152ca40c5dc08ec"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.1+ent/nomad_2.0.1+ent_linux_arm64.zip"
    sha256 "b858e45d23d41132bb2c535ae200eeac00645c87f279b3c2d49bf2522591b7ac"
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
