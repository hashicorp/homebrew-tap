class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.5.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.2/nomad_1.5.2_darwin_amd64.zip"
    sha256 "5eda12a18fcbe277e0a3730f40b6b25ddfa989e8180794e148e4de2f4d414e3f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.2/nomad_1.5.2_darwin_arm64.zip"
    sha256 "d07a31146372490e7891dbf29250d97150ce26f378effe5498c6daedb0bb9014"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.2/nomad_1.5.2_linux_amd64.zip"
    sha256 "51d0ecf23f4740d078287eaef2f4da9f3420b087907d33480ef2ec49628d6461"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.2/nomad_1.5.2_linux_arm.zip"
    sha256 "13f9d0e4da5e491546c3981ddbe5a718a48bdc76f43fc6e2adccd7043c9795ed"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.2/nomad_1.5.2_linux_arm64.zip"
    sha256 "2872b5d31d6d3fa5fa4253f257671715011887027cdf3bd3de697c4bfb6f3e77"
  end

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive successful_exit: false
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
