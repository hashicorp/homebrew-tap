# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.5+ent/nomad_1.7.5+ent_darwin_amd64.zip"
    sha256 "749564ae16342f25837ba9b91a32ff9032fda388a4b2efb1e255e33b6a6fa7f2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.5+ent/nomad_1.7.5+ent_darwin_arm64.zip"
    sha256 "82cfc4f1d385779741e347435bfdd9d39e724b07bf64ed8cbfeafc15c710d414"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.5+ent/nomad_1.7.5+ent_linux_amd64.zip"
    sha256 "bd8d63e7905ccc874ef63f6979cf8c492e4084d049291f155f95b2e71281aedd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.5+ent/nomad_1.7.5+ent_linux_arm.zip"
    sha256 "884d4a67799ad47aca28efde1549fdefc83b30a830e624026aad262130d0db68"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.5+ent/nomad_1.7.5+ent_linux_arm64.zip"
    sha256 "81580d0495b4b145b6ef608f2f1b1ef4c637ded23f7ffb62041a7d788cab51b9"
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
