class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.5.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.1/nomad_1.5.1_darwin_amd64.zip"
    sha256 "9455f3d6403b72c479929f3250bff747430e7d7c5f8da7d7ae1b4349317998e9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.5.1/nomad_1.5.1_darwin_arm64.zip"
    sha256 "ff64a916183a721bd1d6dbedb4f42e1c9746a0055265563bcb64acc39018079f"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.5.1/nomad_1.5.1_linux_amd64.zip"
    sha256 "da4b976dfcab27d16fc03e95719685d4ce603b13a3e5ba692df7c434024dc294"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.1/nomad_1.5.1_linux_arm.zip"
    sha256 "316f1c5d99ac8b0d4fd71c9d172ba0d4356bbbda5b428d0e6b7deb506161a7be"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.5.1/nomad_1.5.1_linux_arm64.zip"
    sha256 "39232209be428e981ed89788608d75a77f3a1dd6838c5fe5fc7380879fb5cdde"
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
