class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.11.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.1/vault_1.11.1_darwin_amd64.zip"
    sha256 "25d3a4e9c6207feb3682244772fea5964374ecc30488a27d5e63e74dc44fd76a"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.11.1/vault_1.11.1_darwin_arm64.zip"
    sha256 "5a23c3bc1dbd3c78cbb42b8b62a6893b052f51b0b22d26e2acd8244fb188aeb3"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.1/vault_1.11.1_linux_amd64.zip"
    sha256 "aa2ed532d9a0ecc8635fed63cb3fb6de472b4c01ca622a9a199cd92a046bc73a"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.1/vault_1.11.1_linux_arm.zip"
    sha256 "c265f8c18d1525cedc815364a6a645dde061624a4ff6037b68e3ef957659ae18"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.1/vault_1.11.1_linux_arm64.zip"
    sha256 "0ce2090b6c191cb2126d2c4c480a8da5a96064396ae18e7cc678ff926189c27e"
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
