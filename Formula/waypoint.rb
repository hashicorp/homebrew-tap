# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.2/waypoint_0.11.2_darwin_amd64.zip"
    sha256 "3b6eb6bffee74bc9954a2939616660f2a8f17c0569265f7dcb9d02c0b976eca6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.11.2/waypoint_0.11.2_darwin_arm64.zip"
    sha256 "97f518757c0e51ad4f6b0b573a25c77eab41b7ff2efc90815b2e4eb473bd2cd9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.2/waypoint_0.11.2_linux_amd64.zip"
    sha256 "d825543b2b82951cce0a8ec7451eb630e1648c4b64886bca88c8b9623f8465f2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.2/waypoint_0.11.2_linux_arm.zip"
    sha256 "3fb9b19a41307a7d3f8529467a7ae63bd89e903e44c616cf6cf0f456bedde9f6"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.2/waypoint_0.11.2_linux_arm64.zip"
    sha256 "b43651b983ef58f2281aa377f0968300e28e5574c8dfac111183a53f531d41d5"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
