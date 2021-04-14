class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.15.0"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_darwin_amd64.zip"
    sha256 "96537262e38008a421d329ce51c1bc2a1926f0b4e68270c92a81a8a42fa2c513"
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
    url "https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip"
    sha256 "69c5db7bd6d4a5d3dd060678e5c3d9442e32610ed05879b4325e6aa4807d0529"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_arm.zip"
    sha256 "f9b034762d0acdb04b4d7a095c1c6a4088e6e064cc510a6d6e2479e957406204"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_arm64.zip"
    sha256 "a83897c82bbfc01a390fbd9acd3cd0cc91f179705385b6ae276a0d8de98a8cba"
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
