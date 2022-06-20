class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.11.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.0/vault_1.11.0_darwin_amd64.zip"
    sha256 "503c0c0be05fd35116ccd15cae970e17f2193b31b1ef4b3c99156f1ab28d8589"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.11.0/vault_1.11.0_darwin_arm64.zip"
    sha256 "c4c8d4d8d4e8a574faa323bfdf9151669d292895509605cfe60a5ed31dfc4f62"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.0/vault_1.11.0_linux_amd64.zip"
    sha256 "00ec42bed75680c440a16d16c196ab07a1012255448de36af709ec19f1c5b957"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.0/vault_1.11.0_linux_arm.zip"
    sha256 "689c00113783181007bfcdcb795d343216d79ea3c891602c6121e1fe81ea0f28"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.0/vault_1.11.0_linux_arm64.zip"
    sha256 "e483b173bed84df453f6f11dba25ffa24548374190652983a96223cb50fdb46e"
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
