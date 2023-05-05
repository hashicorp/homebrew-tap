# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.5+ent/nomad_1.5.5+ent_darwin_amd64.zip"
    sha256 "bbdca6fe604325faa6fa72cfbd5a655344993e642faaa3fe78c98c780e993840"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.5+ent/nomad_1.5.5+ent_darwin_arm64.zip"
    sha256 "134bfba99b77f352ff278db72725b4f8f2cf43158b5a59d03908595a3a8c99dc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.5+ent/nomad_1.5.5+ent_linux_amd64.zip"
    sha256 "0fcb1d10582e9f2b93d8094ec09808d06dc6ef9d7168cc36a8dc43b3ea68f5b5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.5+ent/nomad_1.5.5+ent_linux_arm.zip"
    sha256 "6950cb7e61b21c2d2e4eec10714202750703fffb19ddb8fac1a057e4ae38b037"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.5+ent/nomad_1.5.5+ent_linux_arm64.zip"
    sha256 "e74dfb8cfb6e6b97bab3fcc7b533b31d6fbe1f200eda995cc26dd3fcbda076d6"
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
