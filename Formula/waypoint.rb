# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Waypoint < Formula
  desc "Waypoint"
  homepage "https://www.waypointproject.io/"
  version "0.11.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.3/waypoint_0.11.3_darwin_amd64.zip"
    sha256 "6b8f6f28404f83988359572d1dbeb4d84b2dc00b54cd3e299bdb9f09c664e020"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/waypoint/0.11.3/waypoint_0.11.3_darwin_arm64.zip"
    sha256 "3980d62f9c9cd8144412d3eb4ba0f669b1dbd86bb4840a8a2d8746da92ab3339"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/waypoint/0.11.3/waypoint_0.11.3_linux_amd64.zip"
    sha256 "17e9e39bf8ffc658ae162c8dc3418a16752109042c2e5f1e07896b117c3616d1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.3/waypoint_0.11.3_linux_arm.zip"
    sha256 "cbd4244541d0e93d8833a1e68c60ea6d6933014aa6f129b3ed530e140b9d92df"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/waypoint/0.11.3/waypoint_0.11.3_linux_arm64.zip"
    sha256 "d76c2b17561be5576411805909f373de508bdc2834bca34eb0bc4aa54c9ee376"
  end

  conflicts_with "waypoint"

  def install
    bin.install "waypoint"
  end

  test do
    system "#{bin}/waypoint --version"
  end
end
