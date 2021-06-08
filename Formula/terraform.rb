class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.0"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_darwin_amd64.zip"
    sha256 "b67f5e25a73866b83880fd6fbc5e57add3ed893a31eda26b748aea4afc7255c4"
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
    url "https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip"
    sha256 "8be33cc3be8089019d95eb8f546f35d41926e7c1e5deff15792e969dde573eb5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_arm.zip"
    sha256 "9a08693fc466f28adc40dde7b23f2da6ce2947493ca6b78c68fb7a3c716ff4b5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_arm64.zip"
    sha256 "ca7a3c5d03912d7a4b425866c6972e61a3f4595a2e19d800f797ef1fa5d206fe"
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
