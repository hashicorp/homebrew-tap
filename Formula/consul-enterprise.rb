class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.15.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.0+ent/consul_1.15.0+ent_darwin_amd64.zip"
    sha256 "a2a6f4a527277acb9d2bc4626428b3d1736e4cf40c0b417151660bab3931025a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.15.0+ent/consul_1.15.0+ent_darwin_arm64.zip"
    sha256 "1f6aa08713892c28dffd999a6691d42ebd64127932f6e5785dec24bdf2cfeaf0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.15.0+ent/consul_1.15.0+ent_linux_amd64.zip"
    sha256 "207e4fc36e4b0ab93092b646ef0c9fc415eebfde84591600c16c1ceb5057d4dd"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.0+ent/consul_1.15.0+ent_linux_arm.zip"
    sha256 "f5602e55b1db29ecac975e6051d5fcd0cdb537b4e5e0df6afa0e05ba25a99c42"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.15.0+ent/consul_1.15.0+ent_linux_arm64.zip"
    sha256 "17b6b653d79b4294631b51c8b09d1c943a8fec153cd3a425bebd46543372b557"
  end

  conflicts_with "consul-enterprise"

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
