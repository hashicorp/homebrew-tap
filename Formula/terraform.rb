class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.14.10"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.14.10/terraform_0.14.10_darwin_amd64.zip"
    sha256 "4b2acb55c6350cba92769c852d4502dff3e185726fc5293e3ab0bb64393846c4"
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
    url "https://releases.hashicorp.com/terraform/0.14.10/terraform_0.14.10_linux_amd64.zip"
    sha256 "45d4a12ca7b5c52983f43837d696f45c5ed9ebe536d6b44104f2edb2e1a39894"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.14.10/terraform_0.14.10_linux_arm.zip"
    sha256 "3594abff30bd487e814ea458321fb003541b361c8441d65650a44d08bcce0d0b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.14.10/terraform_0.14.10_linux_arm64.zip"
    sha256 "e69e69796e7dbb9462d52a22295541fbd7ffa5a9b979ba4bee963309bc65a73d"
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
