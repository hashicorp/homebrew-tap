# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Hcp < Formula
  desc "HCP CLI"
  homepage "https://github.com/hashicorp/hcp"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.2.0/hcp_0.2.0_darwin_amd64.zip"
    sha256 "f3a0140f8e5e78b24c0baa45cc4d496c6189be61f7ab1fa181c079363dd0a594"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/hcp/0.2.0/hcp_0.2.0_darwin_arm64.zip"
    sha256 "8e4a0b82104911f98923eb6e76fe325066d9be48043542cb71fca84364203aa0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/hcp/0.2.0/hcp_0.2.0_linux_amd64.zip"
    sha256 "fcf41a0f52f79ef9d9c6a3584c6f4fb65ace54ed4f67772d364b2db2315943e3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.2.0/hcp_0.2.0_linux_arm.zip"
    sha256 "658b0356e97f74f3e09472ab97d652d5855432348cd8f1b9c729fbb0cacf3229"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/hcp/0.2.0/hcp_0.2.0_linux_arm64.zip"
    sha256 "5a6df1a011c968ad8bd6ab653b12261c73e336d36b7307b37c4c29bf4406c2a7"
  end

  conflicts_with "hcp"

  def install
    bin.install "hcp"
  end

  test do
    system "#{bin}/hcp --version"
  end
end
