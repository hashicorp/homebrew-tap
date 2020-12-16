class Nomad < Formula
  desc "Nomad"
  homepage "https://www.nomadproject.io/"

  url "https://releases.hashicorp.com/nomad/1.0.1/nomad_1.0.1_darwin_amd64.zip"
  version "1.0.1"
  sha256 "247064ff81bb6bbb35761b14e66f9077b31b5551414d2ad0178b5e4f7ff3b392"
  bottle :unneeded

  conflicts_with "nomad"

  def install
    bin.install "nomad"
  end

  plist_options manual: "nomad agent -dev"

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
