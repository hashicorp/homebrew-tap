class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.8.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.1/vault_1.8.1_darwin_amd64.zip"
    sha256 "f87221e4f56b3da41f0a029bf2b48896ec3be84dd7075bdb9466def1e056f809"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.8.1/vault_1.8.1_darwin_arm64.zip"
    sha256 "571985c34990a2a7b913cee8c50be42b34c8d8cb751a2aed2c80121ad4b4e44b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.1/vault_1.8.1_linux_amd64.zip"
    sha256 "bb411f2bbad79c2e4f0640f1d3d5ef50e2bda7d4f40875a56917c95ff783c2db"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.1/vault_1.8.1_linux_arm.zip"
    sha256 "fda5f70ae3c721c8b43637514f2bdb863e1f6f1de08c668c3c0a496e8e032793"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.1/vault_1.8.1_linux_arm64.zip"
    sha256 "cd2a4cb4b64bb1f9e1a3e4d3227021713c86af2b6e3af227cb96c3b311b30014"
  end

  bottle :unneeded

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
