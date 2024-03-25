# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class ConsulAws < Formula
  desc "Consul AWS"
  homepage "https://github.com/hashicorp/consul-aws"
  version "0.1.2"

  if OS.mac?
    url "https://releases.hashicorp.com/consul-aws/0.1.2/consul-aws_0.1.2_darwin_amd64.zip"
    sha256 "3bd2d8c0863bcc491af7d45b20a01d28234bae24449fe73f71897aac513ddb0b"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul-aws/0.1.2/consul-aws_0.1.2_linux_amd64.zip"
    sha256 "c1a44fd4df8c455a6e4279f83938171087901e17fbff46adbe10c9697fbfb503"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul-aws/0.1.2/consul-aws_0.1.2_linux_arm64.zip"
    sha256 "16145d50885aeb6d588b9a35ec4492e5e6960f7c68d4d2f16b0581397e5821f2"
  end

  conflicts_with "consul-aws"

  def install
    bin.install "consul-aws"
  end

  test do
    system "#{bin}/consul-aws --version"
  end
end
