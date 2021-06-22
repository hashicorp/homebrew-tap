class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.10.0"

  if OS.mac?
    url "https://releases.hashicorp.com/consul/1.10.0/consul_1.10.0_darwin_amd64.zip"
    sha256 "32ceed91ec2393d9e56c3ee14ba421fc1c4aac2f50e5a5871f393f0212d1a494"
  end

  if OS.mac? && Hardware::CPU.arm?
    def caveats
      <<~EOS
        The darwin_arm64 architecture is not supported for this product
        at this time, however we do plan to support this in the future. The
        darwin_amd64 binary has been installed and may work in
        compatibility mode, but it is not fully supported.
      EOS
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.10.0/consul_1.10.0_linux_amd64.zip"
    sha256 "7cd2e67ce2779c74ce18d880ccdfdc00a655eb71a6a7a956e6d3b71e7937ca0f"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.10.0/consul_1.10.0_linux_arm64.zip"
    sha256 "f35ebca5d8898b5117cc1f491509e8af46f87b93b5aeee8efdf4f30799efaaca"
  end

  bottle :unneeded

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
