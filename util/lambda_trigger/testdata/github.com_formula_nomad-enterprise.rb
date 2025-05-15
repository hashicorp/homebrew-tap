# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.3.5+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.3.5+ent/nomad_1.3.5+ent_darwin_amd64.zip"
    sha256 "098a48d43a8b3f9d99483e050585790584e8480b9c36d862ef3ec25a04771fa4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.3.5+ent/nomad_1.3.5+ent_darwin_arm64.zip"
    sha256 "a14fd62aed34e06f14421a99e19b668d80f7868af57c8b3f59dae4177e2a6300"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.3.5+ent/nomad_1.3.5+ent_linux_amd64.zip"
    sha256 "cd41ff13ff417a7a449ede4e5fbf02613c9e7f497f5657d866e926455fa88e9d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.3.5+ent/nomad_1.3.5+ent_linux_arm.zip"
    sha256 "23be6d1f4902893e64e21b30d9d8c7f483a57f81f2377513ecc91eec541c6f9c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.3.5+ent/nomad_1.3.5+ent_linux_arm64.zip"
    sha256 "c682566a208e78a780d6e0bf8518629e4d3cb3d7fcdf6d9657e76f1d577fda3b"
  end

  conflicts_with "nomad-enterprise"

  def install
    bin.install "nomad"
  end

  plist_options manual: "nomad agent -dev"

  def plist; <<~EOS
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>KeepAlive</key>
    <dict>
        <key>SuccessfulExit</key>
        <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
        <string>#{opt_bin}/nomad</string>
        <string>agent</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/nomad.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/nomad.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/nomad --version"
  end
end
