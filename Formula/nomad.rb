class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"
  version "1.4.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.0/nomad_1.4.0_darwin_amd64.zip"
    sha256 "8460bd1e7c947d0075ce08b35da15b19ac6fbc1fb718407e680bcd5b795d8f63"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.0/nomad_1.4.0_darwin_arm64.zip"
    sha256 "a1707130397135898ea7c4fed9bb08a06bc077340f99a6903e13591f2c03cbe9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.0/nomad_1.4.0_linux_amd64.zip"
    sha256 "7584e25ee2396f6c7ca99cfce97a67756ef2444dabfe96d2b926e2758c38767a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.0/nomad_1.4.0_linux_arm.zip"
    sha256 "7853bc1dbea348c81e51755d096c48192d75015c0bfc728b94d2e6d67b3bc479"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.0/nomad_1.4.0_linux_arm64.zip"
    sha256 "b4816e0a95e2a1515a0b80b25eb81d8aa385fe5f6de119fd04dac89ad0c5d373"
  end

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  plist_options manual: "nomad agent -dev"

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
        <string>#{opt_bin}/nomad</string>
        <string>agent</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/nomad.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/nomad.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/nomad --version"
  end
end
