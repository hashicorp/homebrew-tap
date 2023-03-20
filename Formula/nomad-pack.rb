class NomadPack < Formula
  desc "Nomad Pack"
  homepage "https://github.com/hashicorp/nomad-pack"
  version "0.0.1-techpreview.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview.3/nomad-pack_0.0.1-techpreview.3_darwin_amd64.zip"
    sha256 "3a73f692053d4e12c904d782a35d5cab6669cb4a3e9f5398802c1f9fc7050330"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview.3/nomad-pack_0.0.1-techpreview.3_darwin_arm64.zip"
    sha256 "445263a0b55c0978953a75f935b65c45007f548342ac63fc12f5352c610130dc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview.3/nomad-pack_0.0.1-techpreview.3_linux_amd64.zip"
    sha256 "825cbe6f6053ad4eab4bc298a901cb957b6331fdb3db4b6a896e620a2b96f3c3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview.3/nomad-pack_0.0.1-techpreview.3_linux_arm.zip"
    sha256 "a91b42ff413b80d6f20954e086ae42b88c3b1e28fee0f057cc6f18967eb9001d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad-pack/0.0.1-techpreview.3/nomad-pack_0.0.1-techpreview.3_linux_arm64.zip"
    sha256 "838236643b8c8f26fe2afddd97ffc13cceaed31538ae6f2be2f46f8d520769cb"
  end

  conflicts_with "nomad-pack"

  def install
    bin.install "nomad-pack"
  end

  test do
    system "#{bin}/nomad-pack --version"
  end
end
