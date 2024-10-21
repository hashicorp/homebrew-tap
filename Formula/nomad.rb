# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.1/nomad_1.9.1_darwin_amd64.zip"
    sha256 "2fe2e3c2f2b949c9832ed32966c074bfd874c3f4b3da055e751ef5e8689aea59"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.9.1/nomad_1.9.1_darwin_arm64.zip"
    sha256 "ac5ef9b9600493daf92236c51e3b2cbee5155151f543c6a9030914e5c4ed53da"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.9.1/nomad_1.9.1_linux_amd64.zip"
    sha256 "6a3ad4d9afd8986b48df0cb73a6ac0fb72888b0795c17a1db03f80b832411205"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.9.1/nomad_1.9.1_linux_arm64.zip"
    sha256 "ba58cd862ff02778859c44cdddeced93da5c6d304ce9994fdc7feb4a13ab6f19"
  end

  conflicts_with "nomad"

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
