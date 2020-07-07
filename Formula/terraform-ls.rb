class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.4.1"
  bottle :unneeded

  if OS.mac?
    url "https://releases.hashicorp.com/terraform-ls/0.4.1/terraform-ls_0.4.1_darwin_amd64.zip"
    sha256 "ac1795dd8e3fa08cc68bd847a8ab153b57c229ff9b0e1c88d17e2f0cc34f74e4"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://releases.hashicorp.com/terraform-ls/0.4.1/terraform-ls_0.4.1_linux_amd64.zip"
      sha256 "ec4f3a0ef9a96cee2439e50b0729f38407e4d4370ff9de67a055cb03169598f6"
    end
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
