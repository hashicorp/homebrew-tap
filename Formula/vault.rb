class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.12.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.0/vault_1.12.0_darwin_amd64.zip"
    sha256 "1042cdf626ed05734332dcbd566548f4622f4320b1c1d7aa8ec89f9fa6d32cc4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.12.0/vault_1.12.0_darwin_arm64.zip"
    sha256 "efc6506b909c4ccc055302ff1e782b2e214b3bcbb740ce46e8cd78d0046a38f9"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.12.0/vault_1.12.0_linux_amd64.zip"
    sha256 "56d140b34bec780cd458672e39b3bb0ea9e4b7e4fb9ea7e15de31e1562130d7a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.0/vault_1.12.0_linux_arm.zip"
    sha256 "90509373fd7f1d68866edbfc67589d00d18f550337cf6181cf5a5e90c46bc160"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.12.0/vault_1.12.0_linux_arm64.zip"
    sha256 "8178d5d3354934eb53cceeb212e4ec4bf2a60b2ae48150a7157898288c20519e"
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
