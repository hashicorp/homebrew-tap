# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Sentinel < Formula
  desc ""
  homepage "https://docs.hashicorp.com/sentinel"
  version "0.30.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.30.0/sentinel_0.30.0_darwin_amd64.zip"
    sha256 "8fe9769d8ad29675c161b4c75e51b3030438816d98af554bf08b63c34c130045"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/sentinel/0.30.0/sentinel_0.30.0_darwin_arm64.zip"
    sha256 "a1f57cbb26b9c42e5f42676d50fa5338a701d3e5f5653395cfb16195b31b9bcc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/sentinel/0.30.0/sentinel_0.30.0_linux_amd64.zip"
    sha256 "edab6a46a372592d9762df61f9fe61b6c9085583e329e1860694640c4aed6dd7"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.30.0/sentinel_0.30.0_linux_arm.zip"
    sha256 "51b82ab1d4bc41ee697936dac8dfbd8d9004097f53a76fd2af68c660bbe2612d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/sentinel/0.30.0/sentinel_0.30.0_linux_arm64.zip"
    sha256 "a3b71f575f08e76a9e29df21cc9872b457622ea1e55210ee9d28173bbc283e99"
  end

  conflicts_with "sentinel"

  def install
    bin.install "sentinel"
  end

  test do
    system "#{bin}/sentinel --version"
  end
end
