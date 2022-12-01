class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.30.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_darwin_amd64.zip"
    sha256 "5ba2c6d888e09c2e41c74a71a388eeb9c7cd19eb8fef7d5330b2f06e442e2a82"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.30.1/terraform-ls_0.30.1_darwin_arm64.zip"
    sha256 "ecf35a134895e7fd054c6a665af39eda9db8b0a1aea1f0ef2f6592a85bd9bee8"
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
