class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.9.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.4/vault_1.9.4_darwin_amd64.zip"
    sha256 "25f98a267ea2f4a7b15880592281f0497b78233d0460c1027654c13dcd4a7df9"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.9.4/vault_1.9.4_darwin_arm64.zip"
    sha256 "a46f6aef71c7d6db6e04fe45524df4c69ae9d24c0d7e9602d76f62fe3515398b"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.4/vault_1.9.4_linux_amd64.zip"
    sha256 "9be49dc07a1b73cc78dd5e5cca88588758bb1994fd954ae2c983eb5986887db5"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.4/vault_1.9.4_linux_arm.zip"
    sha256 "ebb2bd7b38719648a02dec93119a44de9a1c92decbb5e61349ed5a48fcd7ed4d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.4/vault_1.9.4_linux_arm64.zip"
    sha256 "420d338c965e8ed4d31babe7ac69d44ad2ce898c54c4bb9b16cc6280ffef0763"
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
