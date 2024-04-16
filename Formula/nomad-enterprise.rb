# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.6+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.6+ent/nomad_1.7.6+ent_darwin_amd64.zip"
    sha256 "b5bf502deaff923f17bc7218a42c8c5ab1181c462c42b9f7655f3e9c893ee347"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.6+ent/nomad_1.7.6+ent_darwin_arm64.zip"
    sha256 "633e29f1cc8050fad1f3f89c4fc003cfd86dc08f5e674f06c468e0a86abe9555"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.6+ent/nomad_1.7.6+ent_linux_amd64.zip"
    sha256 "dce2f6cae87424eff1f3e8f7a78cc99348391e4107e3358bc377c162cd96470a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.6+ent/nomad_1.7.6+ent_linux_arm.zip"
    sha256 "cbb6616e80b77cc52af64fa0f10b137b66b4a72a402c44f73dce3882d02e1f7d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.6+ent/nomad_1.7.6+ent_linux_arm64.zip"
    sha256 "7a4f546cbb3182c95460e6d75c3919dedf5bccbf61106abca799466fc1a7b786"
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
