class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.15.3"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_darwin_amd64.zip"
    sha256 "2cfa2f896aaf2c2b2fdadea6881f2796fe0d85ad0a42f471aadfb113bc32d11b"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip"
    sha256 "5ce5834fd74e3368ad7bdaac847f973e66e61acae469ee86b88da4c6d9f933d4"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_arm.zip"
    sha256 "d022162bc1c0f7e73dbbf810c4591b72234ee409626b2f04108686d83d9f1bc9"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_arm64.zip"
    sha256 "71df9fdeedd823465dae434f479e29a745a792b2315030925b39838f519f8bf3"
  end

  bottle :unneeded

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
