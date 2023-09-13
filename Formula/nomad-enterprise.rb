# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.6.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.2+ent/nomad_1.6.2+ent_darwin_amd64.zip"
    sha256 "93ee6c43d7b14b810f64b5fb31e37c98bcac965c6385336f859d614500324b05"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.2+ent/nomad_1.6.2+ent_darwin_arm64.zip"
    sha256 "03dd8d29d9c6687237088e32f28066e60b9ac970ca25ab20fb0f90eb66b47f94"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.2+ent/nomad_1.6.2+ent_linux_amd64.zip"
    sha256 "a97996425479d4eb6c4ac3af540194c95d4421db89f890ef411b2f72ac6167b7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.2+ent/nomad_1.6.2+ent_linux_arm.zip"
    sha256 "ae18b073593fa010937dcb286bc2c8c9f899edc79fc24fda53f64374438bf811"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.2+ent/nomad_1.6.2+ent_linux_arm64.zip"
    sha256 "26ac04550f06e3ae258c00e720c656037d460bc94f5b0075465ff76e2ee778c7"
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
