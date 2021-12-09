class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.9.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.1/vault_1.9.1_darwin_amd64.zip"
    sha256 "b8a5bd625e0f8f1589f3ce8e5401e5d6c6cf860616a0be8824ae38bdcccb42c6"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.9.1/vault_1.9.1_darwin_arm64.zip"
    sha256 "274ab0501727651654e534d00772bcc0d13aadd402d41a32fe028d411bd46042"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.9.1/vault_1.9.1_linux_amd64.zip"
    sha256 "90fd702db924b55093668a55693d21fd62aa006dcf77d83ba9eaee9383085893"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.1/vault_1.9.1_linux_arm.zip"
    sha256 "2e6e85cdb287ed9d86a865d8cdcd199d9d62ecdff41e753f3e91163ecb58f2eb"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.9.1/vault_1.9.1_linux_arm64.zip"
    sha256 "794e6cd79b41b9915384918db678ce574eed881a158d2487312f6c6365aa3b5a"
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
