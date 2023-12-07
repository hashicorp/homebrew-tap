# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.7.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.0+ent/nomad_1.7.0+ent_darwin_amd64.zip"
    sha256 "e7778eec4a3534112d69b2f2c33749114ab985ed7ec02db89c094dbb1f45e95c"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.7.0+ent/nomad_1.7.0+ent_darwin_arm64.zip"
    sha256 "1391bc78d0ec5102e158e7171bf61ccde40eb65b528ff08d437df21cb641b5f7"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.7.0+ent/nomad_1.7.0+ent_linux_amd64.zip"
    sha256 "87cc7a95ddc949872e7f0fde09f1d03c83da0994c22cc3c457bf703507238973"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.0+ent/nomad_1.7.0+ent_linux_arm.zip"
    sha256 "6c66c8c65b7f2fef31d90f99a6f78934b464065e3a41300fba2c82032e8dfe99"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.7.0+ent/nomad_1.7.0+ent_linux_arm64.zip"
    sha256 "ef079ede3ca679135373fedbe7043a5232b483bbf75c8b0437ad9400a9361564"
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
