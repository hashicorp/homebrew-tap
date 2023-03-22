class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.2+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.2+ent/nomad_1.5.2+ent_darwin_amd64.zip"
    sha256 "bd6a0c0b27b26d9482dd2cf166d0ce9c31193c89ff21b9bf60e8aec8790f234a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.2+ent/nomad_1.5.2+ent_darwin_arm64.zip"
    sha256 "fdb48ea1082f8d5f66fd2841353adb5d8d513dc7701cb5be74e3b82c74ce3fff"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.2+ent/nomad_1.5.2+ent_linux_amd64.zip"
    sha256 "b97eb29952a255d549703f12592bf4fdd91023d27beb4e72a52685e736ed794e"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.2+ent/nomad_1.5.2+ent_linux_arm.zip"
    sha256 "defe011c7902e21d8b0fa9f3a22a70741b3e563a3d7298fceec46c8af80ba22b"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.2+ent/nomad_1.5.2+ent_linux_arm64.zip"
    sha256 "28a8cfb667a739bd60fae96ce334e56d50ad3078fe9a68a16aa644b618e10c1a"
  end

  conflicts_with "nomad-enterprise"

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
