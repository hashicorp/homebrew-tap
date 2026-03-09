class Enos < Formula
  desc "A tool for powering Software Quality as Code by writing Terraform-based quality requirement scenarios using a composable, modular, and declarative language."
  homepage "https://github.com/hashicorp/enos"
  version "0.0.36"

  depends_on "hashicorp/tap/terraform"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.36/enos_0.0.36_darwin_arm64.zip"
    sha256 "93338cf22db528d58dd72dd7c4e7668ff000ae3358cd75c351b98df86e233573"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.36/enos_0.0.36_darwin_amd64.zip"
    sha256 "62a371ee1683fb5bf1f0adc1b5438a738cf9af146c5058ac03b61dd14e08c1b7"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.36/enos_0.0.36_linux_arm64.zip"
    sha256 "18b1f4dab3a4d0426a0a1172f18f4ec49b40da2f79a1b7ef811a6673877dd6d4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/hashicorp/enos/releases/download/v0.0.36/enos_0.0.36_linux_amd64.zip"
    sha256 "7a096ea7e8251dfdfaf5226b2712ce86d3e474d2032a29e187cbe235ee554b37"
  end

  def install
    bin.install "enos"

    generate_completions_from_executable(bin/"enos", "completion")
  end

  test do
    system "#{bin}/enos --version"
  end
end
