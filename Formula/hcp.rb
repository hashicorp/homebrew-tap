# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.9.1/hcp_0.9.1_darwin_amd64.zip"
    sha256 "2f3df271461d2f4232111ffc486ae8106bb7b92929db376064915dc3bf1a0ce1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.9.1/hcp_0.9.1_darwin_arm64.zip"
    sha256 "0354485ed1088431813d5eaa232aa99306cdcc96fe990a30c806036203025413"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.9.1/hcp_0.9.1_linux_amd64.zip"
    sha256 "8e9b14e8ca7191f805452674ec622d46118ad09e618f91fd88fa43670b85d2d9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.9.1/hcp_0.9.1_linux_arm.zip"
    sha256 "9226ef5e011f034c6f2c3951af40264ffc25ab25f38d1e8cb5282d65e238e2c8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.9.1/hcp_0.9.1_linux_arm64.zip"
    sha256 "0bddcdcd094ce91668c2c427d44852ef268d5dc59b07a47860281a4c75522b4a"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
