class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.30.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_darwin_amd64.zip"
    sha256 "cc4dbbee7863583be22833f38011d57652a834d5a6a8a14b90194e31b5753380"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.30.3/terraform-ls_0.30.3_darwin_arm64.zip"
    sha256 "351870376607d68efa876dcdd37111c989e4a970f6fb1424718091ecb4b20c21"
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
