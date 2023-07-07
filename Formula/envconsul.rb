# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Envconsul < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.13.2"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/envconsul/0.13.2/envconsul_0.13.2_darwin_amd64.zip"
    sha256 "0e08ebedc24511f56c4a5b3f16177767289544b0414e1ee2333ee15a04f3dd7b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/envconsul/0.13.2/envconsul_0.13.2_darwin_arm64.zip"
    sha256 "a323e17c2d69e38f1c3da7e8c3a0c0d4da3492d20a40fdcdb719556264fc2962"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/envconsul/0.13.2/envconsul_0.13.2_linux_amd64.zip"
    sha256 "3a2719ad53e6b180f2accc9cd1b165fdca38a2e11e72504229a1aaaac9e7bd00"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/envconsul/0.13.2/envconsul_0.13.2_linux_arm.zip"
    sha256 "e98e41a87f409e1a9618872e72ef4bf5d1c03f8517f17baa7745f92d7c7d4305"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/envconsul/0.13.2/envconsul_0.13.2_linux_arm64.zip"
    sha256 "a413d7c6cae56de2b0b7215a64e74ee718a76ad2f9205ce95871340b5d7dfbd9"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
