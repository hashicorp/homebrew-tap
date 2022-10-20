class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.13.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.3/consul_1.13.3_darwin_amd64.zip"
    sha256 "9e1ef8b51c1dba1b2af474062351042d1b586e90e06d6036622099af45c0842a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.13.3/consul_1.13.3_darwin_arm64.zip"
    sha256 "6a2ff505ecf8f7d0a195a91036c6e4815e915bcaa521a14c465a7747efa983df"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.13.3/consul_1.13.3_linux_amd64.zip"
    sha256 "5370b0b5bf765530e28cb80f90dcb47bd7d6ba78176c1ab2430f56e460ed279c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.3/consul_1.13.3_linux_arm.zip"
    sha256 "b9538525b3b4c10c1e1f4414b67861fae2810a8495489d0bc5e906e6f63ec1c3"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.13.3/consul_1.13.3_linux_arm64.zip"
    sha256 "3c195602a2815c5fd670e9282455cd7213423da80fb353ee92a5d3e688da36d0"
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
