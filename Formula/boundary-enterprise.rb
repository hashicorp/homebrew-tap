# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.17.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.2+ent/boundary_0.17.2+ent_darwin_amd64.zip"
    sha256 "976dd9b7cc845c70d280907b96d087447ca8254e2360bd9535dc026235be24e6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.17.2+ent/boundary_0.17.2+ent_darwin_arm64.zip"
    sha256 "486cac33e6972bf8cd5060a575f2ebc6da10170cbe245b7a7fe3dfd7e7278fc7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.17.2+ent/boundary_0.17.2+ent_linux_amd64.zip"
    sha256 "18961f3ca376b65aed032220993a38bf93a1df0a33910b3bb2670efd3a076d3f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.2+ent/boundary_0.17.2+ent_linux_arm.zip"
    sha256 "ce7e322ee4d728494ea84fc55bbb15851f6c5acfa3c837b2b6a86f6d255b2f48"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.17.2+ent/boundary_0.17.2+ent_linux_arm64.zip"
    sha256 "686e1bbe117851e1c572a2a0c5b10780fe621be84b78b232a5046a90d44418d1"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
