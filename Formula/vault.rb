class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.11.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.4/vault_1.11.4_darwin_amd64.zip"
    sha256 "b7adbba2c25cd971661ad1a054deff0b0e200fd81aac1e35fb6274b83254bfe8"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.11.4/vault_1.11.4_darwin_arm64.zip"
    sha256 "0fc70b482cc61554219cc65369703439ad7af6701a6f62c09b1c9db33204ed37"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.11.4/vault_1.11.4_linux_amd64.zip"
    sha256 "8764a55bdd69faedaaf5d50325d5e6806041e6305b1e66454b46dc6426d26556"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.4/vault_1.11.4_linux_arm.zip"
    sha256 "6140a42586ec4d8503b145ef0ea08db56a38f291c5e85124c2bd8c438ecbf113"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.11.4/vault_1.11.4_linux_arm64.zip"
    sha256 "60d635963201b6d06abda1c2c74199931492665bc8e716417caf248865f5f9aa"
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
