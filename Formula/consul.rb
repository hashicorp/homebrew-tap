class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.14.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.4/consul_1.14.4_darwin_amd64.zip"
    sha256 "694b8edc470838d8a73df08d6c616d25b54724abad410fa27c83697b372a2cfc"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.14.4/consul_1.14.4_darwin_arm64.zip"
    sha256 "330ddff6d6cc16ce091b8f25a4abd0f1984d88f10e272efcec52e01aaaa1b3b0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.4/consul_1.14.4_linux_amd64.zip"
    sha256 "eafb7c853ce9cc1536bffa99325f8df365ff70a3b83c037836e63964a8adfd7a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.4/consul_1.14.4_linux_arm.zip"
    sha256 "d61386ff3d99f23686e3525b73cb0732472ef38a6a37430d5a0cfb4603576b97"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.4/consul_1.14.4_linux_arm64.zip"
    sha256 "9baf47a75c95945824da0629bc0b3f7b1ca55015e8c9ce7579d9a431a90b721c"
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
