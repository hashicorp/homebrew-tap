# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.3+ent/nomad_1.9.3+ent_darwin_amd64.zip"
    sha256 "39e0629ba88e6428d642d6cca630da18c075943197cafe954b0603f6beb342f4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.3+ent/nomad_1.9.3+ent_darwin_arm64.zip"
    sha256 "ad66da9be43515db1e025c8445e3fb5efa46a53d8b00723e63d5f7a4c28551e1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.3+ent/nomad_1.9.3+ent_linux_amd64.zip"
    sha256 "0f60544a4c46e5bba344b2b53c48a11017c4a6df2ef2f6accd4662bd24fd887f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.3+ent/nomad_1.9.3+ent_linux_arm64.zip"
    sha256 "af62f21a34092fdd8d2392a818592153bacf35a0d191b1de8b8a9d77706bfcde"
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
