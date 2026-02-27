# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.21.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.1+ent/boundary_0.21.1+ent_darwin_amd64.zip"
    sha256 "0b5a1cf86888706775997b07293e3b878072ec2c11e2141950073f348c223768"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.21.1+ent/boundary_0.21.1+ent_darwin_arm64.zip"
    sha256 "7cd7565efe65c0292a978d79d5c8e574a7cc82e73f758d0d66b4550655110271"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.21.1+ent/boundary_0.21.1+ent_linux_amd64.zip"
    sha256 "ca525b22d8422cfec964ccbfc42da1ba25eb0d84b53ae55a19d6530d18169912"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.1+ent/boundary_0.21.1+ent_linux_arm.zip"
    sha256 "fb0cd156a159fe23195caeb4a3c4393944f6606e19b6230860f72b8e27f9c8c3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.21.1+ent/boundary_0.21.1+ent_linux_arm64.zip"
    sha256 "faed2cbe67a7b050d35e72f3519eb3cfc3d649aeda9b865bb024acbf34308ea4"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
