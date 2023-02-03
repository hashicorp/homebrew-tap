class ConsulEnterprise < Formula
  desc "Consul Enterprise"
  homepage "https://www.consul.io"
  version "1.14.4+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.4+ent/consul_1.14.4+ent_darwin_amd64.zip"
    sha256 "13dfdf82a254053156dea9858d0a7e8005568f270543c0b5ac33b069c505547e"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.14.4+ent/consul_1.14.4+ent_darwin_arm64.zip"
    sha256 "f2aa7d4102346963f1c88ba50ef110c8ba6e320c6433b19beaac58ceff32251b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.4+ent/consul_1.14.4+ent_linux_amd64.zip"
    sha256 "502e89041fc7142353abc8d0a6b8697752daa4ea15e8806ee0f55687ca9c426c"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.4+ent/consul_1.14.4+ent_linux_arm.zip"
    sha256 "e291e66a8f521293880af044b231d9fed54dea9661cdec306d8e5763a25f40ec"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.4+ent/consul_1.14.4+ent_linux_arm64.zip"
    sha256 "73029ef2565f4d37cf687fb50b4584dfec11c569c66da603e5251043fa70f029"
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
