class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.15.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.0/consul_1.15.0_darwin_amd64.zip"
    sha256 "8cf26909e1f92cc1c26d2c73536e7af5bb9fdca3454b04b4e47ca3d2aab8c85a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.0/consul_1.15.0_darwin_arm64.zip"
    sha256 "c78790e2cfdcdfe74c424a28b0012305e47f5fa85a3b0ee00acbc75442541b76"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.0/consul_1.15.0_linux_amd64.zip"
    sha256 "62a358ff2c3c08d19f15a92ea3130b05b547ab5a767ae13454eab7655a718c24"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.0/consul_1.15.0_linux_arm.zip"
    sha256 "ab9ba2eb19375c82f38f4a9081a9c764557ec69cd5b41508ee30c7b7d50ea09e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.0/consul_1.15.0_linux_arm64.zip"
    sha256 "2dde0e0d9055baa5eb66ebfe9ca81c34ca8e405fb2e8ff61315c0e2aa12c6d7d"
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
