class Tfplugindocs < Formula
  desc "Generate and validate Terraform plugin/provider documentation"
  homepage "https://github.com/hashicorp/terraform-plugin-docs"
  version "0.13.0"
  license "MPL-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/terraform-plugin-docs/releases/download/v#{version}/tfplugindocs_#{version}_darwin_amd64.zip"
    sha256 "ef7cf03a06ef4fb5b24a4b5f2057e7fb87501351a5f3c21f57433ab51873e1b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/terraform-plugin-docs/releases/download/v#{version}/tfplugindocs_#{version}_darwin_arm64.zip"
    sha256 "4ac8a08750e483abc345f466995f110e4f0e7c370dc1698d99710fba0691ff99"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/terraform-plugin-docs/releases/download/v#{version}/tfplugindocs_#{version}_linux_amd64.zip"
    sha256 "4167876e830d6904340805eea8e563b66cfa4fd71f1a056cdfd2b3d55993adf7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/terraform-plugin-docs/releases/download/v#{version}/tfplugindocs_#{version}_linux_arm64.zip"
    sha256 "92e09b88db432d679e55aa98d0619baab89544744eed694182e30f05d8d1a872"
  end

  def install
    bin.install "tfplugindocs"
  end

  test do
    system "#{bin}/tfplugindocs", "--version"
  end
end
