class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"
  version "1.8.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.2/vault_1.8.2_darwin_amd64.zip"
    sha256 "e33982eb861a539a8122bf674c39af30901825c060b4c8175cbfa06e9b5d4bf5"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/vault/1.8.2/vault_1.8.2_darwin_arm64.zip"
    sha256 "2ee88db949d21a43f4997539a0bed9350018c25da769d261343c35c8dc9cc878"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/vault/1.8.2/vault_1.8.2_linux_amd64.zip"
    sha256 "d74724d6cc22bf1e1c7c519009b0176809acf6f1c20ee56107de0cab54cd8463"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.2/vault_1.8.2_linux_arm.zip"
    sha256 "7fa4df01af03906d356b2b5616660528e0337c78c943dd23b8f1d85bd313121d"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/vault/1.8.2/vault_1.8.2_linux_arm64.zip"
    sha256 "0a03433509f2c594a0355deb67270c77fbc6d70e802cc5223584c3b60029e202"
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
