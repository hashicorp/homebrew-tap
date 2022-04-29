class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.10.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.2/vault_1.10.2_darwin_amd64.zip"
    sha256 "8329b4eb75e04eed82c09d35e5b1645f0bc4390dad9de5dee4566b5f66f04ff5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.10.2/vault_1.10.2_darwin_arm64.zip"
    sha256 "7d0ec9cc163b179180e7dcc7a494af029cfacc3173d699b9bc92c69a7b948896"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.10.2/vault_1.10.2_linux_amd64.zip"
    sha256 "97f355fc435e5e768f1c7f40b6e1c40d6062e01dcfc0adb6b966dab49e9de7d1"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.2/vault_1.10.2_linux_arm.zip"
    sha256 "1f44f2e571f7caf81cf19dd278d1e2c3835de024f03b95bd95a830f86caf2c0e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.10.2/vault_1.10.2_linux_arm64.zip"
    sha256 "10e283aca455fd9bfc54294b154494de37f82074c67e0064d304978c5d3077e2"
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
