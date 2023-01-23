class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.30.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_darwin_amd64.zip"
    sha256 "d392d3b59d1ccc09d4f056d5751bb4f77113b46271a8ff4dbf3c3f6efbb58161"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_darwin_arm64.zip"
    sha256 "194e2c9383103b90cb30a5687ea92699adc689a0971558af41724f06add7fdfc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_linux_amd64.zip"
    sha256 "8d0881ee3e1dad98d8dbef7ace7ffd15e43ac34d3f1b96948d53659ad19d6421"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_linux_arm.zip"
    sha256 "d9217ba75d15d45916e5d1fc0e25d1512949289a8935aa6174f9f53a3f7a3014"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_linux_arm64.zip"
    sha256 "780c677b33533e0d2e03ad5ac255893ce722708a07b1ec9f4cbeea00509bfb72"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
