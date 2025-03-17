# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.19.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.1+ent/boundary_0.19.1+ent_darwin_amd64.zip"
    sha256 "0360248b54782b3018c6fdbf5d258c9930ff59229e64908a2ca31a2fbfc0f805"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.19.1+ent/boundary_0.19.1+ent_darwin_arm64.zip"
    sha256 "4284bd77188343c70e4c7137b93fed918cfeba4117921519a4ece04a1adc9ce5"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.19.1+ent/boundary_0.19.1+ent_linux_amd64.zip"
    sha256 "b510bb4bc47d3f028bbf2fee1c914a44713d4f9dee9ba4602d1fdbd43189dec4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.1+ent/boundary_0.19.1+ent_linux_arm.zip"
    sha256 "323a474c18aec02233c031fcc95f5ca61d3f99399db57eca6bef8de243828347"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.19.1+ent/boundary_0.19.1+ent_linux_arm64.zip"
    sha256 "33797454857433c5e0dd643ac1cfdfc3f6cfeee24df8122d8cc3e4bebfed25d1"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
