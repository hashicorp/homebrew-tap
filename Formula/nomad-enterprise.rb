# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.6.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.0+ent/nomad_1.6.0+ent_darwin_amd64.zip"
    sha256 "62e9924b50f62c0d5f529dd0877ff8f26403a540b6bd83c2ea97e6b627efda0e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.6.0+ent/nomad_1.6.0+ent_darwin_arm64.zip"
    sha256 "f7ccaf4b8341f52a028d48969f52d7c60c43656dfc9c3fd3f23c7db546f737dc"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.6.0+ent/nomad_1.6.0+ent_linux_amd64.zip"
    sha256 "b4be392ecc362664b8142ef04b32cc6cc6eb9437b81c5fa386487ec81086bd79"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.0+ent/nomad_1.6.0+ent_linux_arm.zip"
    sha256 "1c4c0fd0ea451ed24c97087326203d0c2de7e4fafe2e473faeda7b31fb6455dd"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.6.0+ent/nomad_1.6.0+ent_linux_arm64.zip"
    sha256 "f971ee86ced2a5d783d2450b9677a6c2d5c1511fe6a2c6325d9eda4ba01cc2af"
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
