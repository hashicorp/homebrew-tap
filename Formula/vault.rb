class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.9.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.2/vault_1.9.2_darwin_amd64.zip"
    sha256 "a10e7cb752a8459f198ed564b8583b3a8935e7ae996306ba468838dc6204c3c4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.9.2/vault_1.9.2_darwin_arm64.zip"
    sha256 "d2102267c6d3ffa78bdddc3ed6be3a7e2a874eaac23c8467a2e30e4d55eeff78"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.2/vault_1.9.2_linux_amd64.zip"
    sha256 "1e3eb5c225ff1825a59616ebbd4ac300e9d6eaefcae26253e49209350c0a5e71"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.2/vault_1.9.2_linux_arm.zip"
    sha256 "f6be548757c6460eb4ae68af6dd55d58adc15a5017442562b2ae9db75a819fa8"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.2/vault_1.9.2_linux_arm64.zip"
    sha256 "8bb97e3f8b556def39b9d2d380a15af45a0b2cc3582a0d50573ccef840008b74"
  end

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  plist_options manual: "vault server -dev"

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
        <string>#{opt_bin}/vault</string>
        <string>server</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/vault.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/vault.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/vault --version"
  end
end
