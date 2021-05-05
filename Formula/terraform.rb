class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.15.2"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.15.2/terraform_0.15.2_darwin_amd64.zip"
    sha256 "d13b507e6f51fc58d880313775262954369fa6c98e163fa71e21b7d2a613c32a"
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
    url "https://releases.hashicorp.com/terraform/0.15.2/terraform_0.15.2_linux_amd64.zip"
    sha256 "6d4780cbbe49f2d49eb49e8d7a90f5b8d5beec7e64d80d3f8eb0c6e19156a26b"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.2/terraform_0.15.2_linux_arm.zip"
    sha256 "8ab0c49cba6e443acae61239a4c371698cb45856094f69f8e9f21d3c0daa4d28"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.2/terraform_0.15.2_linux_arm64.zip"
    sha256 "646e3ae3db87bde44d6076c01e5e9911fb8d9c7369ff9ac2260aed261ebb4194"
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
