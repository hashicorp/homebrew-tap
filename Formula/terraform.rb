class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.0.1"

  if OS.mac?
    url "https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_darwin_amd64.zip"
    sha256 "32c5b3123bc7a4284131dbcabd829c6e72f7cc4df7a83d6e725eb97905099317"
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
    url "https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip"
    sha256 "da94657593636c8d35a96e4041136435ff58bb0061245b7d0f82db4a7728cef3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_arm.zip"
    sha256 "4b95512b651837da3bef8da25c0621ba345f99a2418ee730691e27cb28d841fd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_arm64.zip"
    sha256 "af9c579d59e5180e563a12a69f5acb95fcc61ec2a39ac24aaf13aee33463760c"
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
