class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.12.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.2/vault_1.12.2_darwin_amd64.zip"
    sha256 "76d985c42a254bf16fa55fbf39092a34e27aba22942c2f829a6ce81ac5fdc40f"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.12.2/vault_1.12.2_darwin_arm64.zip"
    sha256 "f1fa420858eb8674416a2285cb48f9887c680eb3437235cc06c69a30178de708"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.2/vault_1.12.2_linux_amd64.zip"
    sha256 "116c143de377a77a7ea455a367d5e9fe5290458e8a941a6e2dd85d92aaedba67"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.2/vault_1.12.2_linux_arm.zip"
    sha256 "fdc33fbe90daf7a496863c568fccfc98cdd664e034ae3a380c877fc6570fc7a5"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.2/vault_1.12.2_linux_arm64.zip"
    sha256 "7b35d12518729cfe3efe2007a07862934b0a6df053146ea15243f89e6b0bfbf2"
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
