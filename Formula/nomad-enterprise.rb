class NomadEnterprise < Formula
  desc "Nomad Enterprise"
  homepage "https://www.nomadproject.io/"
  version "1.4.0+ent"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.0+ent/nomad_1.4.0+ent_darwin_amd64.zip"
    sha256 "d301e1de11a08e474f05f29633badf9863ef7ea6705af6e2e13443a5a3643ea4"
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.hashicorp.com/nomad/1.4.0+ent/nomad_1.4.0+ent_darwin_arm64.zip"
    sha256 "af85bc5390d8caec667589a2c6e5eaa2c1864c5d0891426b0c2bf22a1acbff14"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.hashicorp.com/nomad/1.4.0+ent/nomad_1.4.0+ent_linux_amd64.zip"
    sha256 "7b6a8b0b75631738e0eabd7736867a13d7e2e1237c962bf103dc463117759ced"
  end

  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.0+ent/nomad_1.4.0+ent_linux_arm.zip"
    sha256 "b5568cb3c2e024b712b847e42064702e9f117591d7f1c255a2fad73e193cbb70"
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.hashicorp.com/nomad/1.4.0+ent/nomad_1.4.0+ent_linux_arm64.zip"
    sha256 "0abb45e5e60f50c766fc4699ca1a1c37a9ca9d39a77a3659532e94114833039e"
  end

  conflicts_with "nomad-enterprise"

  def install
    bin.install "nomad"
  end

  plist_options manual: "nomad agent -dev"

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
        <string>#{opt_bin}/nomad</string>
        <string>agent</string>
        <string>-dev</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/nomad.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/nomad.log</string>
</dict>
</plist>

EOS
  end

  test do
    system "#{bin}/nomad --version"
  end
end
