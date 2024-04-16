# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.7.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.6/nomad_1.7.6_darwin_amd64.zip"
    sha256 "14e98db7643d4e3a3c9f997399039735ca17dc2872b9d68aac9563217d62f0af"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.6/nomad_1.7.6_darwin_arm64.zip"
    sha256 "996d12611764655d8e26ca82a5c430837fbb66d2435483fb5d95fec850ddc726"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.6/nomad_1.7.6_linux_amd64.zip"
    sha256 "82a438a144066a8f42ceea8548da754c0bd96b5b528cd337a5dc09017afddb56"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.6/nomad_1.7.6_linux_arm.zip"
    sha256 "21894623a02ea69e4124f086d2fced299ad9b8fda7c98c5982ec514e42e058f4"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.6/nomad_1.7.6_linux_arm64.zip"
    sha256 "83d89d553f68ecf09efd98d0e026f67ffe45e97a98ed70352ba855e4613ce6ea"
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
