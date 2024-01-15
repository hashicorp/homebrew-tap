# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_darwin_amd64.zip"
    sha256 "6759d54aebb804220f55b5d1cd0deeaf97ce4420d47744ebd8204d4c3b8962df"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_darwin_arm64.zip"
    sha256 "b423450bdb334a5a43e8f836e9c7be70914f874a95a7d6ee8b827079ddea576d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_linux_amd64.zip"
    sha256 "ee0d93fe1b2d5aead6bc5c0508c8ac99822e11157c0e1172f5da0d7d139c26c8"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_linux_arm.zip"
    sha256 "3be2463363dc91f49c34010938c1875adf58114e296a82f4b206d697b2481d58"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_linux_arm64.zip"
    sha256 "5d986363290109cbcdce889b1e7b6ec01b86a3759ec56930c78ae0bebfb65f15"
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
