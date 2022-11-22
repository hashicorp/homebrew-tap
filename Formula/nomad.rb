class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.4.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.3/nomad_1.4.3_darwin_amd64.zip"
    sha256 "fc8d750813737bf51f2d53e2a16b2c18a4d466d6b5e314d65734db1cad6bf20b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.3/nomad_1.4.3_darwin_arm64.zip"
    sha256 "4c5cd541fb6297e62d7be887071f25a1c765578e29fde0a784cfa7f9ae7a8ac2"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.3/nomad_1.4.3_linux_amd64.zip"
    sha256 "15ab8fd2da071d93852f59b9a8833e3a764986ef8140c6b11f87621391e63902"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.3/nomad_1.4.3_linux_arm.zip"
    sha256 "a6865dcb716b7ba62e148d7c6052f5ccb58e66251f457b308304591023a9bad8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.3/nomad_1.4.3_linux_arm64.zip"
    sha256 "21b3afc78bca4789ac271a855e2c4a993876d0d3f84499692d0d9dc5c8abf9ca"
  end

  conflicts_with "nomad"

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
