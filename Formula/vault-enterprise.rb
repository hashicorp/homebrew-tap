class VaultEnterprise < Formula
  desc "Vault Enterprise"
  homepage "https://www.vaultproject.io"
  version "1.12.3+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.3+ent/vault_1.12.3+ent_darwin_amd64.zip"
    sha256 "8eb009007ab56d8718cbb2dcc559a4a2b2aa74e8545d0746e1a8a6a63a426370"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.12.3+ent/vault_1.12.3+ent_darwin_arm64.zip"
    sha256 "e074a69a60311f96b3e3807bd64e6fe1cc1e71136894e004fb711ad5af3c9563"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.3+ent/vault_1.12.3+ent_linux_amd64.zip"
    sha256 "f4afa8b0138310c607ff2e0cd8654ef08968d257da464621af390611f81d5cf9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.3+ent/vault_1.12.3+ent_linux_arm.zip"
    sha256 "690eab916d74136858508083f7156027f996415bf9746c18a693791192944b9e"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.3+ent/vault_1.12.3+ent_linux_arm64.zip"
    sha256 "1ecd9c1ae57a32c539c51834a1f73bef255a92c064f46e00e9855cf433eabeff"
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
