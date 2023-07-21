# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "0.2.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.2.2/vlt_0.2.2_darwin_amd64.zip"
    sha256 "22366e58764e0de22aac3bbac336e569740ec43437c0ad7e59ae5a03103642e2"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.2.2/vlt_0.2.2_darwin_arm64.zip"
    sha256 "2d9d1604d82882ff8daeaa1a85919f09500e6e8457d8c0f4b4a8825dec377590"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.2.2/vlt_0.2.2_linux_amd64.zip"
    sha256 "20dc873769b0fe8ba9252218461a51ce803d089efd0c291d318e243aa519e82a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.2.2/vlt_0.2.2_linux_arm.zip"
    sha256 "8eeddd5de122b9c11e563a6bb170caf21fb1a84cd1a7478cbd4d2625dc54b5ea"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.2.2/vlt_0.2.2_linux_arm64.zip"
    sha256 "a03ed3572f18ca666182a57b65aea7b71864a1302675d4e0a126467354b9c7f5"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
