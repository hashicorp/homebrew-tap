# Copyright IBM Corp. 2020, 2025
# SPDX-License-Identifier: MPL-2.0

class ConsulDataplane < Formula
  desc "Consul Dataplane"
  homepage "https://github.com/hashicorp/consul-dataplane"
  version "2.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.0/consul-dataplane_2.0.0_darwin_amd64.zip"
    sha256 "b6780c3a712600fe4a0ed58e8f6f2cb632f12b108e2b54add227b8fd4b250186"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.0/consul-dataplane_2.0.0_darwin_arm64.zip"
    sha256 "2f2c2be27b89a6e11062a0253d917ff04187d9ad951c53f08b61e8e2cbd2d5cc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.0/consul-dataplane_2.0.0_linux_amd64.zip"
    sha256 "bbae5eea9e2685278fb66b9a1a08eba23930fa898b2c2bb422e683c93df7104e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.0/consul-dataplane_2.0.0_linux_arm.zip"
    sha256 "01c3d1a52993967b782208a5a6bf02611ad49f8af29a8a1c1eb76d9c0e6a4c19"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-dataplane/2.0.0/consul-dataplane_2.0.0_linux_arm64.zip"
    sha256 "a67d267f0ecab7917710e3b687aff2b90b8cd95cb79af91f6f2364269c815e92"
  end
  
  depends_on "envoy" => :recommended

  conflicts_with "consul-dataplane"

  def install
    bin.install "consul-dataplane"
  end

  test do
    system "#{bin}/consul-dataplane --version"
  end
end
