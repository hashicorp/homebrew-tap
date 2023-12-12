# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class BoundaryEnterprise < Formula
  desc "Boundary Enterprise"
  homepage "https://www.boundaryproject.io/"
  version "0.14.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.3+ent/boundary_0.14.3+ent_darwin_amd64.zip"
    sha256 "9c264cda52e919235f9467065e80b81aba673b67d71245a46b17ac7803b8fc2f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/boundary/0.14.3+ent/boundary_0.14.3+ent_darwin_arm64.zip"
    sha256 "51eff47079322b7a3b0cf92ccb3a4fe533bf41f178b88f13da5502a635bb7731"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/boundary/0.14.3+ent/boundary_0.14.3+ent_linux_amd64.zip"
    sha256 "b1364d334d56c4b3535ff192817a5a83c63348ec62e1fa3a63ddebe8f1967647"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.3+ent/boundary_0.14.3+ent_linux_arm.zip"
    sha256 "8ac4765a1c378c76a8eaf8fba6b8e979b7787dfd3c9060188eb02f36e2355f75"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/boundary/0.14.3+ent/boundary_0.14.3+ent_linux_arm64.zip"
    sha256 "3ce97701e2737ac01dfbadb3f9a600201291f0ba9b3ac1fb10def4fa40d1565d"
  end

  conflicts_with "boundary-enterprise"

  def install
    bin.install "boundary"
  end

  test do
    system "#{bin}/boundary --version"
  end
end
