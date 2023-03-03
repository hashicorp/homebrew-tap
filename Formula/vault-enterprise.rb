class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.13.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_darwin_amd64.zip"
    sha256 "2a43c56443332ee9d0ea03ae6cacc6239b903c12332d5f2a7ea2d59024fe8d60"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_darwin_arm64.zip"
    sha256 "c8d894c14290c3a8414a01950077251fdf49758aa73d9c94a03b1365270a89fa"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_linux_amd64.zip"
    sha256 "d4888ce1695c11a7671485f4128bb5a30ec04ab5bf53cfa8bfe3b2c3e75b92db"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_linux_arm.zip"
    sha256 "6d9b5f68e556a9eb0ce807ea2a7facd661c02451f720544bbea72e8921e74e35"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.13.0+ent/vault_1.13.0+ent_linux_arm64.zip"
    sha256 "8eb42656e661c778bfdd8badebf9bf4a8998855e3c6ff998be2a7bd67fc5aaff"
  end

  conflicts_with "vault-enterprise"

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
