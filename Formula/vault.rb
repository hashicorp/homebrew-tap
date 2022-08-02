class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.11.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.2/vault_1.11.2_darwin_amd64.zip"
    sha256 "d87b17a5b25bc47ce35f63bf280e1f7d6737905b74d7432a5aa49cd82044ee08"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.11.2/vault_1.11.2_darwin_arm64.zip"
    sha256 "ac9f9e854dda92c3a63290f6ae1983220a83ac39a904bf9dbd1067fa7354cc10"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.2/vault_1.11.2_linux_amd64.zip"
    sha256 "ace4138269cb7214c73529f984b793d66074e3a3ad373eaa77bc9b39490d9ef9"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.2/vault_1.11.2_linux_arm.zip"
    sha256 "ae882482e5cff9cf702305cf37334c249ab704b9c36d43490ec000135e2e0935"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.2/vault_1.11.2_linux_arm64.zip"
    sha256 "111db187b28c0dd29aa91636278132d42b5b18717531d5a34de26b90c86ea02c"
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
