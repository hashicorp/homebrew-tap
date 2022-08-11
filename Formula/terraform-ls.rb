class TerraformLs < Formula
  desc "Terraform Language Server"
  homepage "https://github.com/hashicorp/terraform-ls"
  version "0.29.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.29.0/terraform-ls_0.29.0_darwin_amd64.zip"
    sha256 "c41a85efb4dca058f9bd10d2e7fd7aeecb94ebea4c677588f6a51009b3943c1f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform-ls/0.29.0/terraform-ls_0.29.0_darwin_arm64.zip"
    sha256 "366536c5f073a6e2f3f0ffc7d48a1853ab7807732209b0507fdde85f044d693c"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform-ls/0.29.0/terraform-ls_0.29.0_linux_amd64.zip"
    sha256 "fb4ef3842693af50dbb2db9279b51136013b16bb7a6c06266cad6d148ccd1284"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.29.0/terraform-ls_0.29.0_linux_arm.zip"
    sha256 "f4115c7d8d4dc849911dc0494b943cdf6787ebd4168b4119ee2e8945f892e98b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform-ls/0.29.0/terraform-ls_0.29.0_linux_arm64.zip"
    sha256 "32e41dbca8a9bad7bd5019ca958120b5abf8a543828904bb5821e997446bcd8c"
  end

  conflicts_with "terraform-ls"

  def install
    bin.install "terraform-ls"
  end

  test do
    system "#{bin}/terraform-ls --version"
  end
end
