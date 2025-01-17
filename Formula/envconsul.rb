# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.13.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.3/envconsul_0.13.3_darwin_amd64.zip"
    sha256 "d84c9f68941b232a2bf18dc5f6e791142caab5eb721ff09fe415f6f358234be7"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/envconsul/0.13.3/envconsul_0.13.3_darwin_arm64.zip"
    sha256 "018c7c698c4264eb7132712e46cbf5a39f55ff41051ac12e36adc8b4c6da180b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.3/envconsul_0.13.3_linux_amd64.zip"
    sha256 "675ff2af4137590745b3e6281ff26ad937ebffd949b2479715c39b800c2ea927"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.3/envconsul_0.13.3_linux_arm.zip"
    sha256 "6014ac448fff30d2cc6d9cbefbfcad1aee07ae2b583a830f05c6293fd1b71a88"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.3/envconsul_0.13.3_linux_arm64.zip"
    sha256 "fa6346f6f89a3e68bbdb6ae70e52955ee90f38372ac25509fbe623b9fefbf75c"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
