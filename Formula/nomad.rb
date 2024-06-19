# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.1/nomad_1.8.1_darwin_amd64.zip"
    sha256 "470d9b857de1ceb6feb20905f8fb812cff09292a296ef13140e2001580d3fbea"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.8.1/nomad_1.8.1_darwin_arm64.zip"
    sha256 "f88ab343bb308bf7aed9e5868de8e5298043d2f0e46031143ee1e5ba1de1043e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.8.1/nomad_1.8.1_linux_amd64.zip"
    sha256 "29f91e539562bd377b9ecb82dd928526e24d0ef2b11537960fbbbb200713dc36"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.8.1/nomad_1.8.1_linux_arm64.zip"
    sha256 "b3cd3cb6dcfb4b022272d8c0a594f0d0aacb0ede9855ef2a5a707c4fcfe1715c"
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
