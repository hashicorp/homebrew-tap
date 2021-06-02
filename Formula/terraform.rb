class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.15.5"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_darwin_amd64.zip"
    sha256 "27d5ae2431240dff928e6483170b570782a8dd1a2b7c32ce1793097af1acb9bd"
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
    url "https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip"
    sha256 "3b144499e08c245a8039027eb2b84c0495e119f57d79e8fb605864bb48897a7d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_arm.zip"
    sha256 "3122e7ac6353d488d766ac84379139e3d14f564fbe61f4b069f7584ca9c29e01"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_arm64.zip"
    sha256 "bc5a9d734010e55fb374a4cab9eb0539139d34fd84f58d2242573f275f67fc13"
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
