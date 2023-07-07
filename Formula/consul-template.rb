# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulTemplate < Formula
  release_repository = +ENV["HOMEBREW_HASHICORP_ARTIFACT_REPOSITORY_HOST"] || "https://releases.hashicorp.com"

  desc "Consul Template"
  homepage "https://github.com/hashicorp/consul-template"
  version "0.35.0"

  if OS.mac? && Hardware::CPU.intel?
    url release_repository << "/consul-template/0.35.0/consul-template_0.35.0_darwin_amd64.zip"
    sha256 "f527e5dfad80a9ec1aefd09c641dc9128f267f7bb4974e5c6679279317ef774c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url release_repository << "/consul-template/0.35.0/consul-template_0.35.0_darwin_arm64.zip"
    sha256 "44a16f6b610694b468131a1310d8f2d4d3fd27ef68b448394e5cacfff38ca15b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url release_repository << "/consul-template/0.35.0/consul-template_0.35.0_linux_amd64.zip"
    sha256 "1b1c9127e8da25b2d7322e6f2aa8e6d946336083999e0fdb321f96ffd447eebd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url release_repository << "/consul-template/0.35.0/consul-template_0.35.0_linux_arm.zip"
    sha256 "c6cd4a94662ee6e8b6b1e9969c3ae96a9f188cd87a60048f2bebc0993a02a399"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url release_repository << "/consul-template/0.35.0/consul-template_0.35.0_linux_arm64.zip"
    sha256 "758755e94b89cf6d072b66e2c063f5572249fe4a8a931aed8b72173419faaa35"
  end

  conflicts_with "consul-template"

  def install
    bin.install "consul-template"
  end

  test do
    system "#{bin}/consul-template --version"
  end
end
