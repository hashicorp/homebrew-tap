# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Levant < Formula
  desc "Levant"
  homepage "https://github.com/hashicorp/levant"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/levant/0.4.0/levant_0.4.0_darwin_amd64.zip"
    sha256 "5c82f04a8c229b0a6a212b110229be0917595ab3be9b89cdcb7f7da8c667a789"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/levant/0.4.0/levant_0.4.0_darwin_arm64.zip"
    sha256 "50bc8792f672042e3c23a70b994d2c2075fe8b5c3f9ae0cb5caf55e4c6c4559e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/levant/0.4.0/levant_0.4.0_linux_amd64.zip"
    sha256 "44ff68a3f25b15aded1da2b7bae6ddbcdac09e4517d526d69ed79180bc4240ed"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/levant/0.4.0/levant_0.4.0_linux_arm64.zip"
    sha256 "ee57441091f62f55b3103af6374cff066721f582a8b06b52ba0ebe3b8fb4f102"
  end

  conflicts_with "levant"

  def install
    bin.install "levant"
  end

  test do
    system "#{bin}/levant --version"
  end
end
