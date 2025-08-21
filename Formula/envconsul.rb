# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.13.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.4/envconsul_0.13.4_darwin_amd64.zip"
    sha256 "e89a41c90213a481d10a2a383afb9b13c5a758bc20685b59f1ce4a08a0f3dc40"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/envconsul/0.13.4/envconsul_0.13.4_darwin_arm64.zip"
    sha256 "2833c08107942526529f17808e22ee4f0a5da7cb575a367077bfeafc57b168ec"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.4/envconsul_0.13.4_linux_amd64.zip"
    sha256 "53656bd797ea7e1b91459edfc072613e3a229ede5bd8619465cf961ec450fdc5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.4/envconsul_0.13.4_linux_arm.zip"
    sha256 "0907bab0cbc917c45a050f365181d2964ab6b64d68442a746a04fb0220a85aad"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.4/envconsul_0.13.4_linux_arm64.zip"
    sha256 "4ca7189ee4c0a4183ebc7298daadb4be3db898a5d3d45f3f704b892692938044"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
