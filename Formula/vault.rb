class Vault < Formula
  desc "Vault"
  homepage "https://www.vaultproject.io"

  url "https://releases.hashicorp.com/vault/1.6.0/vault_1.6.0_darwin_amd64.zip"
  version "1.6.0"
  sha256 "10ea90b51d66b85483d167aab6bdc43a3e1ffcfa56f6e24784c0a3d3cb988142"
  bottle :unneeded

  conflicts_with "vault"

  def install
    bin.install "vault"
  end

  plist_options manual: "vault server -dev"

  def plist
    <<~EOS
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
