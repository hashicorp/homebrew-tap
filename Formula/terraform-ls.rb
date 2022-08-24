class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.29.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.29.1/terraform-ls_0.29.1_darwin_amd64.zip"
    sha256 "ebe7f3c84d938658c63952895d514c9368eb77253203345aa719f3b5ea64b0ff"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.29.1/terraform-ls_0.29.1_darwin_arm64.zip"
    sha256 "fdee85cd199f497fad661cf4baf34853b2f411e8b3abe2880d00d4ca21fa2459"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.29.1/terraform-ls_0.29.1_linux_amd64.zip"
    sha256 "92dacfa32265da6fb926a00373227bfb9177ac36b2acdc2b633cb8dd7d9267ea"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.29.1/terraform-ls_0.29.1_linux_arm.zip"
    sha256 "1dbf294cda6164914e217e66660df5d9661eeec4137d39ef650309631d551592"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.29.1/terraform-ls_0.29.1_linux_arm64.zip"
    sha256 "dba80d7a126d7082aad4457ae904b8497865a76eeae5a30fa8603bf31300f1c7"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
