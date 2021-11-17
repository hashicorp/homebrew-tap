class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.9.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_darwin_amd64.zip"
    sha256 "3d72bbd9d8b648d020c80aaed528a664d37760ba96c0cc3d13671a8293776f86"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_darwin_arm64.zip"
    sha256 "ecec46cf78eacef7c2ff2daf91376143e22398c490e179921de71b27fa0cd842"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_linux_amd64.zip"
    sha256 "6ad8b09ca70d5c2822c871b7bd20ecdefb68e9da4c4b9aa6062000a9bff19f7a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_linux_arm.zip"
    sha256 "00d43381599c67b825cbaeb881288b8ff7daecbccd7a6f8dd2d19374174b0880"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_linux_arm64.zip"
    sha256 "632ee67575dd101975bbf281f79fdb59a0dd7a3f5248838c42c93728211e479b"
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
