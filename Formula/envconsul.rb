class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.13.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_darwin_amd64.zip"
    sha256 "bb2f03c2b6f41c111e5b3a81e4743f33f9c8d2d995a690a0bd7453d531d9a94b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_darwin_arm64.zip"
    sha256 "dbf6238f040362ee7c82571931cee0eb8d198bb0d0316805f7407fd8d2c57084"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_linux_amd64.zip"
    sha256 "a28c5ebfa1bdd7c5317dcb17bb7693b0813bd44d1d477dfa6149f48052267905"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_linux_arm.zip"
    sha256 "bd2fe1430d32cf634c4dfa5d5e0e15e40b8b8d8631f0f60ca76e28e7c1c45835"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_linux_arm64.zip"
    sha256 "87867b87accaacc5dea89c8123bf2923767fa584ca29ba46103a47519dcfdeb0"
  end

  conflicts_with "envconsul"

  def install
    bin.install "envconsul"
  end

  test do
    system "#{bin}/envconsul --version"
  end
end
