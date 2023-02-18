class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.0+ent/nomad_1.5.0+ent_darwin_amd64.zip"
    sha256 "5650f09c5e228e0e4de9204995f15836b738a03887b72fbf0dbcaeab103ff394"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.0+ent/nomad_1.5.0+ent_darwin_arm64.zip"
    sha256 "d35195387024317a50e618834686d39df705926c035ed5ab32868ac61bafbe72"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.0+ent/nomad_1.5.0+ent_linux_amd64.zip"
    sha256 "b77789ca7a86d32cf3b766fe80e56b3ecfe75bb12af6f4beacef93d0a3dc1d30"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.0+ent/nomad_1.5.0+ent_linux_arm.zip"
    sha256 "4b0fc8cd9be4c0387f5889a9618a0060792987c471f01a366fff45819749e9e0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.0+ent/nomad_1.5.0+ent_linux_arm64.zip"
    sha256 "b25b943832cb85c697500565f0eeb15c404979fc00a5e37c43d31b481235e526"
  end

  conflicts_with "nomad-enterprise"

  def install
    bin.install "nomad"
  end

  service do
    run [bin/"nomad", "agent", "-dev"]
    keep_alive true
    working_dir var
    log_path var/"log/nomad.log"
    error_log_path var/"log/nomad.log"
  end

  test do
    system "#{bin}/nomad --version"
  end
end
