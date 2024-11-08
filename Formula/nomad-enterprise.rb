# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.2+ent/nomad_1.9.2+ent_darwin_amd64.zip"
    sha256 "f7469148ec2ec3dc7a9ade99d8b84de4bc0c3fcf68c917135ac657b81155003e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.2+ent/nomad_1.9.2+ent_darwin_arm64.zip"
    sha256 "a3fbfb2fc04f4cdc747027d43d2a177746f033f37c7fb68a67402ff6e1efbe13"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.2+ent/nomad_1.9.2+ent_linux_amd64.zip"
    sha256 "a408d8326c0025a88353bf7018d533d8cdf4658ca010178ebc8415006ba392df"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.2+ent/nomad_1.9.2+ent_linux_arm64.zip"
    sha256 "59cfc163079b3c93c4c4a3c21e1813732ca5494700b6b52a56dd8a84d9e0f53d"
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
