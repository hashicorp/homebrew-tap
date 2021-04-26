class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "0.15.1"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/0.15.1/terraform_0.15.1_darwin_amd64.zip"
    sha256 "dd7220e6a76e4c9555576c0500bea94c6a5cb65f286b3e74e8ea7cc34bbce5be"
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
    url "https://releases.hashicorp.com/terraform/0.15.1/terraform_0.15.1_linux_amd64.zip"
    sha256 "1ff798791abf518fb0b5d9958ec8327b7213f1c91fb5235923e91cc96c59ef2c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.1/terraform_0.15.1_linux_arm.zip"
    sha256 "e39b377edf4cf029ecd8ae38c248a3f6a3921d8bfaa1ca0dcc5c960c1b4945de"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/0.15.1/terraform_0.15.1_linux_arm64.zip"
    sha256 "39aa72b66b5802a2909a17ed14ffe7bcf3b6466a91710989c4e6cb854d594538"
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
