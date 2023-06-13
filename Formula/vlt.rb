# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class Vlt < Formula
  desc "Vlt CLI"
  homepage "https://github.com/hashicorp/vlt"
  version "0.2.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.2.1/vlt_0.2.1_darwin_amd64.zip"
    sha256 "66daa04f83c16d932ab06b8082aa34cb7617087d8bde1d5a96cfcca14ffeb347"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vlt/0.2.1/vlt_0.2.1_darwin_arm64.zip"
    sha256 "07bf12e5aec00939f4206d8024060330e509a51aeff45730024d4ef1c2e0ff9d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vlt/0.2.1/vlt_0.2.1_linux_amd64.zip"
    sha256 "844ebe6a765972b5546a405cb46b5f623abb9a3c05e4ce3b19dea5235b872ad5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.2.1/vlt_0.2.1_linux_arm.zip"
    sha256 "6f62b816fd6f2d5b4bd5230beeb956c7550e1eefe9857709b8e0c7b2e1c2bf3a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vlt/0.2.1/vlt_0.2.1_linux_arm64.zip"
    sha256 "4a6486f5dc8d8e78044ed22dae0ef8681946178dbee24b08a7973e4ba889ab1d"
  end

  conflicts_with "vlt"

  def install
    bin.install "vlt"
  end

  test do
    system "#{bin}/vlt --version"
  end
end
