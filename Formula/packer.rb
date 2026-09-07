# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class Packer < Formula
  desc "Packer"
  homepage "https://www.packer.io/"
  version "1.16.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.0/packer_1.16.0_darwin_amd64.zip"
    sha256 "64c4aa9a3176f89496360843bc8747238c9ad32ddc68bc5281207ae342d45be9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/packer/1.16.0/packer_1.16.0_darwin_arm64.zip"
    sha256 "6530042cf8f8a1f96b6607cb22b5be298be53b400cd4a2c81ab8b946964fccda"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/packer/1.16.0/packer_1.16.0_linux_amd64.zip"
    sha256 "5edcd14ab59b535040c512dbecd6ec9ef976a000b073c19d93e4c431c948581e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.0/packer_1.16.0_linux_arm.zip"
    sha256 "ea4f55fe0a2b38d57c8261d7a0999b17d4fcea03306b7781f52d09d99de26347"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/packer/1.16.0/packer_1.16.0_linux_arm64.zip"
    sha256 "cf18f03460d92265d49b56befff333e80641d845822799eab04357c39f75b5d7"
  end

  conflicts_with "packer"

  def install
    bin.install "packer"
  end

  test do
    system "#{bin}/packer --version"
  end
end
