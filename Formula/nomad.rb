class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.4.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.1/nomad_1.4.1_darwin_amd64.zip"
    sha256 "2e95973442855a18d1ac27667a318786bcc156eef18e6b7a595dd1e14ef6a27d"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.1/nomad_1.4.1_darwin_arm64.zip"
    sha256 "6a5b685628901e69265ca65e0c4230c998ff31069aab5325241dec6d23904396"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.1/nomad_1.4.1_linux_amd64.zip"
    sha256 "f9327818a97fc2f29b6a9283c3175cd13ba6c774c15ee5683035c23b9a3640fa"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.1/nomad_1.4.1_linux_arm.zip"
    sha256 "7661e6b0b00837540b1cefc6b32a8a014c0a18bdf75906b54c38c91c35d52b16"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.1/nomad_1.4.1_linux_arm64.zip"
    sha256 "b3662b65c622b234a7f85adfd1003e4cfd3ab7a2571d3892320443b58228496b"
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
