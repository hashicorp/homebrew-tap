# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.3+ent/nomad_1.7.3+ent_darwin_amd64.zip"
    sha256 "24db498d8c2350ecf3eb03cd33bbe816a0da11e6e26c9c1f7f3cfaad78a549f1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.3+ent/nomad_1.7.3+ent_darwin_arm64.zip"
    sha256 "068340e64a62eb2929e3eeea8f238035a1e5bc5d55249467761c62b7369c7987"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.3+ent/nomad_1.7.3+ent_linux_amd64.zip"
    sha256 "b9bdd985f923502d579c1063da576bec8f7c70ad61a46ff052cdcfb631a4ff51"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.3+ent/nomad_1.7.3+ent_linux_arm.zip"
    sha256 "25d6a114b998998301bc8fd3a19ad38511fb277bc92279c8edcb305374232182"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.3+ent/nomad_1.7.3+ent_linux_arm64.zip"
    sha256 "26712681e27b97cf4ae6a23578c2cd07d912765e932ffbc69892d94feaf4c357"
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
