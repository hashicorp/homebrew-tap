# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.24.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.2/sentinel_0.24.2_darwin_amd64.zip"
    sha256 "ee89ef68c8662badf6c4e781fcf6c08ae47aca53ba8e9a873afdc13bb861b1ba"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.24.2/sentinel_0.24.2_darwin_arm64.zip"
    sha256 "8027a8764802612fbb8d1247aa659b1d03a7607568fbd6a659cc23d7507d1bad"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.24.2/sentinel_0.24.2_linux_amd64.zip"
    sha256 "a17aad9797e7b9b0072c887c2e761703e2bee742ff327011ccec5e6686fc5b8b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.2/sentinel_0.24.2_linux_arm.zip"
    sha256 "e97c62d57af9da0a262e5ce1496c5b5c34e625266785683b97a322942ccf3c97"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.24.2/sentinel_0.24.2_linux_arm64.zip"
    sha256 "371e9d47ce4b94721280faf141f989ef7a145114295e7463bc7c9833b7e1d8b4"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
