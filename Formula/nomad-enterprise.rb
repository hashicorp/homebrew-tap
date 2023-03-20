class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.5.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.1+ent/nomad_1.5.1+ent_darwin_amd64.zip"
    sha256 "c378c40f672cdeed7e30886a909eebebfe10b108e0baeda5461e08f4c47c85b0"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.1+ent/nomad_1.5.1+ent_darwin_arm64.zip"
    sha256 "16fd9b9325c5253b0851f8a115075f1131add3fe24c8958786fff51867544448"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.1+ent/nomad_1.5.1+ent_linux_amd64.zip"
    sha256 "ea7cbc56c8aaaba31425054e716ab2274e29c7edbf44ea451d45a3d8e3681574"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.1+ent/nomad_1.5.1+ent_linux_arm.zip"
    sha256 "f8d69525fe132dc0f8b42442a7906b007b4826ad39f002e21ae1e4bf859656a8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.1+ent/nomad_1.5.1+ent_linux_arm64.zip"
    sha256 "34ebf4ed62096902be3eecd37eba553cc8e82552418a012ef923805e32eec19e"
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
