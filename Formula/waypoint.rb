# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.11.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.1/waypoint_0.11.1_darwin_amd64.zip"
    sha256 "f8aea7d352504842c8310744b17540ba265d9b75df70defcfaf0b92fd868bb0a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.11.1/waypoint_0.11.1_darwin_arm64.zip"
    sha256 "b156ea1371c319ce5f5a160d8acb2c76aefbbc28e72712c5aaf06ac19091c125"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.1/waypoint_0.11.1_linux_amd64.zip"
    sha256 "849221f7bfeb1309e913d5ce4cf391184fdb5f2295ac67160e48d36550be10db"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.1/waypoint_0.11.1_linux_arm.zip"
    sha256 "ca06ae1056b8bed39b20ca60aa9c9692f897f0081608360e53ab9e4fe8daf201"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.1/waypoint_0.11.1_linux_arm64.zip"
    sha256 "297b346e963f9f1483318b461afe09c8d68c7057a113391fdd360b05afe49ae7"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
