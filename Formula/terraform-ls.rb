class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.30.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_darwin_amd64.zip"
    sha256 "36a68f38e6919ed21e531a20cfdffa6e90f60bc05276892746fa4e9e924262d1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_darwin_arm64.zip"
    sha256 "30ec15292751675986ceb626fc802f15250192ca4208a5a6caf57d1edf9ad398"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_linux_amd64.zip"
    sha256 "d8e8640491962a26d6e83321ac3c688a93362759910f1ab9b8c580c7308d830c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_linux_arm.zip"
    sha256 "66dab6908f3bb8675bf4468a4097217a436550c3d798527ceee5c6f6747c800e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_linux_arm64.zip"
    sha256 "714b5f621e7d0e6e65e2fb321d4e2116a65df9c83715dd5eb5796a9a6f344944"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
