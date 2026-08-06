# Copyright IBM Corp. 2020, 2026
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "2.0.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.4+ent/nomad_2.0.4+ent_darwin_amd64.zip"
    sha256 "21f3c49a49c5dbb55ab864dca28abbe1b91c129ef659d1961a2b1ea5246f5b42"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/2.0.4+ent/nomad_2.0.4+ent_darwin_arm64.zip"
    sha256 "c68f13ff078f6644da46836962f38fac209c80a5b4176fec67e31a3e4ffd9446"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/2.0.4+ent/nomad_2.0.4+ent_linux_amd64.zip"
    sha256 "9d919c6faf9abd164be8d972344c8a2bde124b9fef7bafde248b420ca43e96f0"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/2.0.4+ent/nomad_2.0.4+ent_linux_arm64.zip"
    sha256 "bf815fb72b895c4abc34adcf4ddb63b7fd92efad6f08152e381b225a2bb89330"
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
