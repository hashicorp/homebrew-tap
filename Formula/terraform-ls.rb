class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.30.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.2/terraform-ls_0.30.2_darwin_amd64.zip"
    sha256 "cc576cdbe551009dd7700280751b4a45b8ec6b69b130310d5cd8a151b727e4fc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.30.2/terraform-ls_0.30.2_darwin_arm64.zip"
    sha256 "1c06c4aefe16144b78ddf90f97ac739c4d6315b52017fe8fbb9bbf4bce5982b8"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.30.2/terraform-ls_0.30.2_linux_amd64.zip"
    sha256 "5ba4d7894e1d3121b133048ab141d06aa886320dee083f3460bd9078f13390b2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.2/terraform-ls_0.30.2_linux_arm.zip"
    sha256 "32adcf87fc82f41d6afa3b6c2cfd6b9fc73d22d6ff5ec9ae03bde7d996291b34"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.30.2/terraform-ls_0.30.2_linux_arm64.zip"
    sha256 "9e92a6a0fb3a62db68b6ea26b6c57f3fec27bd3582d5fb7299597fb2cf36bafb"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
