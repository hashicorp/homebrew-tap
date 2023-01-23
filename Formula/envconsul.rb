class Envconsul < Formula
  desc "Env Consul"
  homepage "https://github.com/hashicorp/envconsul"
  version "0.13.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_darwin_amd64.zip"
    sha256 "fb84f0f2757592c1c88c2c835bd932f5b828d6c29f125ac875a8d85efdf59d63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/envconsul/0.13.1/envconsul_0.13.1_darwin_arm64.zip"
    sha256 "a79c3ba5b67f612eadfa0ca63f4194be39ac1ed70b6e89c1ffb75ff596b8a0ed"
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
