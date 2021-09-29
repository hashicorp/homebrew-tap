class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.8.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.3/vault_1.8.3_darwin_amd64.zip"
    sha256 "5ecb5f468a7fd301824c575e4b9e69d6becf5e03b30958f485542530859a7319"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.8.3/vault_1.8.3_darwin_arm64.zip"
    sha256 "3a90eb2f5b549911e3969c87fe0623695fcde8b2f5c861436c7e3b9af3354d0d"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.3/vault_1.8.3_linux_amd64.zip"
    sha256 "c756477a64726e57cc8261b6cf1dc09d99a19f643de76bf79f38b71c4be5984f"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.3/vault_1.8.3_linux_arm.zip"
    sha256 "ba5b7a6681de6aaf744fd592cc388f80d21a1c439e6c26b798bf9fbc88387bd1"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.3/vault_1.8.3_linux_arm64.zip"
    sha256 "c783b6fa65008e01f64fdedc26658624ef19c84f9d08c32a19d6e2770dd937fd"
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
