class Terraform < Formula
  desc "Terraform"
  homepage "https://www.terraform.io/"
  version "1.1.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_darwin_amd64.zip"
    sha256 "214da2e97f95389ba7557b8fcb11fe05a23d877e0fd67cd97fcbc160560078f1"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_darwin_arm64.zip"
    sha256 "39e28f49a753c99b5e2cb30ac8146fb6b48da319c9db9d152b1e8a05ec9d4a13"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip"
    sha256 "734efa82e2d0d3df8f239ce17f7370dabd38e535d21e64d35c73e45f35dfa95c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_arm.zip"
    sha256 "afba01532a637df6209dbc38e9dab75add13ff39fdb3254f4ad2c26b0e652df0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_arm64.zip"
    sha256 "088e2226d1ddb7f68a4f65c704022a1cfdbf20fe40f02e0c3646942f211fd746"
  end

  conflicts_with "terraform"

  def install
    bin.install "terraform"
  end

  test do
    system "#{bin}/terraform --version"
  end
end
