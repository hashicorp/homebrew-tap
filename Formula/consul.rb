class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.14.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.0/consul_1.14.0_darwin_amd64.zip"
    sha256 "dd40574071bc2fedb5b4ef1e6a19d976044893abb80f3d4bc86fa3427e7e12a3"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.14.0/consul_1.14.0_darwin_arm64.zip"
    sha256 "02a61dd6ab271a43e1551811e51404bb20fd24db96bfb9aa9f8f716473d20a33"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.0/consul_1.14.0_linux_amd64.zip"
    sha256 "6907e0dc83a05acaa9de60217e44ce55bd05c98152dcef02f9258bd2a474f2b3"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.0/consul_1.14.0_linux_arm.zip"
    sha256 "7f5ba29ae3d43f04e8b14323f7cc19747011fde5fa58e3029e3c43fb9c78637c"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.0/consul_1.14.0_linux_arm64.zip"
    sha256 "078e4f1befb3af12347f5bcbc4997d4b11cf06f4704f043a9967c8af4bdae051"
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
