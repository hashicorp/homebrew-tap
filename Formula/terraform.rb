class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.2.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_darwin_amd64.zip"
    sha256 "3e04343620fb01b8be01c8689dcb018b8823d8d7b070346086d7df22cc4cd5e6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_darwin_arm64.zip"
    sha256 "e596dcdfe55b2070a55fcb271873e86d1af7f6b624ffad4837ccef119fdac97a"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_amd64.zip"
    sha256 "705ea62a44a0081594dad6b2b093eefefb12d54fa5a20a66562f9e082b00414c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_arm.zip"
    sha256 "d93ac2b204a20e95e33b9293eddd33e5f4545c5582d9711379ac6d926f63b03a"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.2.4/terraform_1.2.4_linux_arm64.zip"
    sha256 "11cfa2233dc708b51b16d5b923379db67e35c22b1b988773e5b31a7c2e251471"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
