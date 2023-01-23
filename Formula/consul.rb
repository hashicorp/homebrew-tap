class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.14.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.3/consul_1.14.3_darwin_amd64.zip"
    sha256 "02369a13e19b7bd0cb0c4a6442f2303718fb7ae6893c48085312b3b46832106f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.14.3/consul_1.14.3_darwin_arm64.zip"
    sha256 "32ab0eb1989864ed00030dd0581d293382f93e3207990b9fd2bf018cdc3a3869"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.3/consul_1.14.3_linux_amd64.zip"
    sha256 "2971959d50fae1aa3f6b624219c85e0a4f34cd7232ea14d77d3cfb05f9ce7b8f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.3/consul_1.14.3_linux_arm.zip"
    sha256 "90d637bbd5d8f739424e0b9a809b7c7639d1df1ce939eca08b222808feb07720"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.3/consul_1.14.3_linux_arm64.zip"
    sha256 "37b79f7c6949203fb889a13583352e0961a66b39f2463018dd6c9fd6d731456f"
  end

  conflicts_with "consul"

  def install
    bin.install "consul"
  end

  plist_options manual: "consul agent -dev -bind 127.0.0.1"

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
        <string>#{opt_bin}/consul</string>
        <string>agent</string>
        <string>-dev</string>
        <string>-bind</string>
        <string>127.0.0.1</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/consul.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/consul.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/consul --version"
  end
end
