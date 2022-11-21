class Consul < Formula
  desc "Consul"
  homepage "https://www.consul.io"
  version "1.14.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.1/consul_1.14.1_darwin_amd64.zip"
    sha256 "9911203a5e61ad6a671d636fdebb53963c0d2e61af0d2f0327371858b93a314a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/consul/1.14.1/consul_1.14.1_darwin_arm64.zip"
    sha256 "c889595f7dc8b9d0d112ec93c02ca6fd3bfec27315d8341658387ff7cf4af041"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/consul/1.14.1/consul_1.14.1_linux_amd64.zip"
    sha256 "e544964cf4df3fc18f58bb875bdbad4c7a6ff746ab7f7f6b0d7a0d469893490d"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.1/consul_1.14.1_linux_arm.zip"
    sha256 "76bd620a607bd33474146b1a060d54cb19e284af915a55e6ff9b9dd458cd8148"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/consul/1.14.1/consul_1.14.1_linux_arm64.zip"
    sha256 "31b7ae6c488cd5f9405f5decc879c821cf7aa7d304c8376e570e398e4c44c632"
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
