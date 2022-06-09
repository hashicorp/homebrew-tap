class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.28.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_darwin_amd64.zip"
    sha256 "082b136a81068006f9bc1f4a94654f177f6264b0753689e5296f31465e103961"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_darwin_arm64.zip"
    sha256 "288124eb3d9bbaccb3215db4bea16bc5b197310a0074fc80c067a322f210f85e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_amd64.zip"
    sha256 "c9d3ecf2cbf261708baa77c8412d85a36983efaaf0362b1a18bcb874d4ea1e08"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_arm.zip"
    sha256 "cce8e792a4a13124a3b500ba4353599151724af0c011dfa105524574e61ca5e7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.28.1/terraform-ls_0.28.1_linux_arm64.zip"
    sha256 "efd34800d0fb712dbdbd17b6534da98519dbd448adb4f468977fcd4b0a3107ef"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
