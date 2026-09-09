# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "2.0.6"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.6/nomad_2.0.6_darwin_amd64.zip"
    sha256 "9aae239db6333d82ce2a3a4ea19f8f398c888dee229a21adaebe6e713b83aa96"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.6/nomad_2.0.6_darwin_arm64.zip"
    sha256 "a76e9a8a63d8e6c62bae942834a32fafa66776657c285c0031da0abe3f87107a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.6/nomad_2.0.6_linux_amd64.zip"
    sha256 "c6da734081a41d51cadf15ec880d5eab0313093a29d2ee0984ca5ae1cdf867ec"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.6/nomad_2.0.6_linux_arm64.zip"
    sha256 "6ccc4c25ec0b6b71c30af4df7ae3dfb3f7a0a05173555f94be452d072100cc52"
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
