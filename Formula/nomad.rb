class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.4.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.4/nomad_1.4.4_darwin_amd64.zip"
    sha256 "a1cb6e413cb2e98de74de62f695ce363d3aa998742bccd7949ee4585ec5ef873"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.4/nomad_1.4.4_darwin_arm64.zip"
    sha256 "b052f644fc95d84c543af0a7c3ca26d26eb6a9aa1cecd236535b6c3c434ed658"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.4/nomad_1.4.4_linux_amd64.zip"
    sha256 "63bbb4c1d7c3da7a68dd1e3eed301a4edecf0930b2c5efe4940200ed9c73e350"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.4/nomad_1.4.4_linux_arm.zip"
    sha256 "f3a114effa280e2447dc3a4f9af02ed96fc2f0274b7ff0f9d0068fa11bceb8af"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.4/nomad_1.4.4_linux_arm64.zip"
    sha256 "c0d72c890de7783066256875dc8ec5957c33119f0e53f12d3c98380af75ebdcc"
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
