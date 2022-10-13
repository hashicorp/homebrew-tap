class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.29.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.29.3/terraform-ls_0.29.3_darwin_amd64.zip"
    sha256 "33f453218a6c2f5e261d69d8fa850e7064b7f6b65bdcc889757e02888d95c898"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.29.3/terraform-ls_0.29.3_darwin_arm64.zip"
    sha256 "45d0a2e89e79d3147141a3a83fc66144e0cc0f01a10811d0a10c439f5042c5e7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.29.3/terraform-ls_0.29.3_linux_amd64.zip"
    sha256 "6fe7dd4d58661310d8098035e3384386f5e104d1312ed877ea0ed1310452b385"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.29.3/terraform-ls_0.29.3_linux_arm.zip"
    sha256 "d4092e0391fa4c5937e8f265d3bf3458519bd0801265057f07bc6b91b3674d23"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.29.3/terraform-ls_0.29.3_linux_arm64.zip"
    sha256 "f239549f5d6c74db7795fb8da0fbbd392d3a2dc214a601a1f5a338be2f9ac4bd"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
