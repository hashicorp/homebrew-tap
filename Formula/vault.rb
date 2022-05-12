class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.10.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_darwin_amd64.zip"
    sha256 "bcc8cb973acf857fc7e5f9a04039ec5664cc2c3c97edb1f9b8ab5b2c6c831f62"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_darwin_arm64.zip"
    sha256 "823da02ccc877c988ed710ae5c8eeee46fd65882199a1f5ca0dfa48e49c863f4"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_linux_amd64.zip"
    sha256 "c99aeefd30dbeb406bfbd7c80171242860747b3bf9fa377e7a9ec38531727f31"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_linux_arm.zip"
    sha256 "46a1d3e4f74c3e5f8457212b0306b46ba5224e18c81074533b783e55ccce84bb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.3/vault_1.10.3_linux_arm64.zip"
    sha256 "abc469a8657e5fba47c99799f3a44d736ee55b7f899bb6eecdf9d3f7996286bd"
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
