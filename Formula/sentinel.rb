# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.24.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.1/sentinel_0.24.1_darwin_amd64.zip"
    sha256 "1fbddd7313eb9c197206b3338512929a9dc2ae9b15f5b5a211b6f38e79c3e480"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.24.1/sentinel_0.24.1_darwin_arm64.zip"
    sha256 "f10bb5f20c2a5ae8083e037b97e4b709c93fa62c46394528dbdc760dbd7eca5a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.1/sentinel_0.24.1_linux_amd64.zip"
    sha256 "c0ff4abbdc8a12bcc94129cf6f146662f41de2caf9218e5eaa7356289ea11adb"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.1/sentinel_0.24.1_linux_arm.zip"
    sha256 "fc001895ad8c09cefa8985fa352741aab4f1a19c4540d4900316aafd7539aeb9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.1/sentinel_0.24.1_linux_arm64.zip"
    sha256 "d3a71eb84a255739ec7cfe4f18164e0cb0f490454faea4c50aa22105a0d38dba"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
