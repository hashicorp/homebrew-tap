class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.28.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.28.0/terraform-ls_0.28.0_darwin_amd64.zip"
    sha256 "837e46f1539bb31e1b9eb323611254236236502c0859cf2db5ab5e727992a3ae"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.28.0/terraform-ls_0.28.0_darwin_arm64.zip"
    sha256 "de53e8654f664539322aab2d906bca8892495065aa93b7592957ab2aa7fcc529"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.28.0/terraform-ls_0.28.0_linux_amd64.zip"
    sha256 "29edca9ee4df5900c8d243f628e3cd29eb343cb866111618e91b179605bf91a6"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.28.0/terraform-ls_0.28.0_linux_arm.zip"
    sha256 "dd2b98e6516c2c30f34942257be813a0c3b4f821108771799f19c900d5c15adf"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.28.0/terraform-ls_0.28.0_linux_arm64.zip"
    sha256 "8a6974b8882ecd3233ecbe371372d9aef337c8c12b4c1adf149d23d5d3514532"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
