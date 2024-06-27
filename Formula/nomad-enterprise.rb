# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.8.1+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad/1.8.1+ent/nomad_1.8.1+ent_darwin_amd64.zip"
    sha256 "f1ba069c75f35bb124a0be7dd0c895db43f1eb65012abcf4400b9c0a76583f51"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad/1.8.1+ent/nomad_1.8.1+ent_darwin_arm64.zip"
    sha256 "8ce9d18ac40c73cb961a8f9c8afb1fffd0b29d5b07ee2b085585f3c003d2666e"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad/1.8.1+ent/nomad_1.8.1+ent_linux_amd64.zip"
    sha256 "97e36863ece7cc86b6f5f9e3102de7fd9009ec17ff674a3af43290f0a466ed37"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "#{ENV['HOMEBREW_TAP_HASHICORP_REMOTE'].presence || 'https://releases.hashicorp.com'}/nomad/1.8.1+ent/nomad_1.8.1+ent_linux_arm64.zip"
    sha256 "d68cf392946b58dfddb72549db2c22306a8a8ac48f0f9cc4be90acf9a859ab06"
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
