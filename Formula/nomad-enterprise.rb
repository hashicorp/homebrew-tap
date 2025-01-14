# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.9.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.5+ent/nomad_1.9.5+ent_darwin_amd64.zip"
    sha256 "39fe79d1f377724e62124e0d8a809b749eb739d8fcc1774c3246fd6ada3e5873"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.5+ent/nomad_1.9.5+ent_darwin_arm64.zip"
    sha256 "6e3f9a615af3249a9b5a80dd93a743f8345302cd2fb602efc4b0629855142702"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.5+ent/nomad_1.9.5+ent_linux_amd64.zip"
    sha256 "a2b890b39b9de5dcb39bd088eb8a5b145c51b59dd147516cd4a16ffc5ade0b8f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.5+ent/nomad_1.9.5+ent_linux_arm64.zip"
    sha256 "540655ff6245c3bf7d3a1c3a66b9ce131abbc4cc62537ee33604d26b86a0cdaa"
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
