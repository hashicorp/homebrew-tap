class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.14.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_darwin_amd64.zip"
    sha256 "adeb661b44f246d7461a9cfe729036c17eae6e22749f8964d5f2eb81564abf4b"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_darwin_arm64.zip"
    sha256 "35b2acfa4a6d3dad4b26e95abe1e03251a015fbf5e6452c939098e5aff499ec1"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_linux_amd64.zip"
    sha256 "9024ecc32163da3e33f79f1d6c2962a7fb32436083dd2808353faf0fa3bfb1e2"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_linux_arm.zip"
    sha256 "d5f779a22641b6d7e5b7d478d2711f3b72d98fee5187c5a18224ca21b4768865"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.2/consul_1.14.2_linux_arm64.zip"
    sha256 "ded0df388af3e21cd7d171f0e411e32c6452f6230e9576281921838065a4b36c"
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
