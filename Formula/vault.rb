class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.8.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_darwin_amd64.zip"
    sha256 "8b9b0b2cf28d0d052bd71176667b0b48b99b8a3abe0a64b375863c207873d026"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_darwin_arm64.zip"
    sha256 "e9a5988fba364d71e9e334b5fd93a08c9356542b6e1f33921ffe05fefe28ffaf"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_linux_amd64.zip"
    sha256 "ceb0919c849c21627ca1cae060f361b6fb97dcf04b17d1d7d1dc9953fcd8e329"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_linux_arm.zip"
    sha256 "421c312dc51a7c35e2b1192db7b7056c61d87a00bccb0f25ad6fb61ab8dea41d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.4/vault_1.8.4_linux_arm64.zip"
    sha256 "3270ac43fe2c2923cbbef274017c62ca521762c50fdc839c0bc0edf872072a07"
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
