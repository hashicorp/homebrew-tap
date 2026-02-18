# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.2/nomad_1.11.2_darwin_amd64.zip"
    sha256 "dfe513bc81b6682ab7bc3822c2d37e1fccc1e99dfbbac91783707aabe18401b6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.11.2/nomad_1.11.2_darwin_arm64.zip"
    sha256 "25147d8e14bac4b3072dbdc22b6cc9e356b0246dc5a1dc8ec5a40000077fe9a3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.11.2/nomad_1.11.2_linux_amd64.zip"
    sha256 "e042b0f6f6648b149be7cfddac832214cf8ca17725e5f0e420b5b0547532bdcd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.11.2/nomad_1.11.2_linux_arm64.zip"
    sha256 "c1524421657c97117ffaa5130f8ca54ad10e8e083ecb849e1d864603ceb60825"
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
