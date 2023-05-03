# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.4+ent/nomad_1.5.4+ent_darwin_amd64.zip"
    sha256 "25eaca2e00de7ee0ddc726bfbc83eadd1af2fc98bf9d10a1a94b56c065a59cb3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.4+ent/nomad_1.5.4+ent_darwin_arm64.zip"
    sha256 "ad4ff883c3113945ff84fd7a498c776d5c039f56eae897628bb9e65e2af54609"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.4+ent/nomad_1.5.4+ent_linux_amd64.zip"
    sha256 "d1bfc48c2e39c397ea0473c7881a89b45f51f7b7128bc56d2694f14304329e72"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.4+ent/nomad_1.5.4+ent_linux_arm.zip"
    sha256 "553da9a03a7c29db5017b335335cb73868a0287bdbae972ce97b114fd556def8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.4+ent/nomad_1.5.4+ent_linux_arm64.zip"
    sha256 "bc67164a420f13910a1b4f985639cd8499a74d10a4b2894c10b817d1510619de"
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
