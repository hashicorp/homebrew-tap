class ConsulTerraformSync < Formula
    desc "Consul Terraform Sync"
    homepage "https://github.com/hashicorp/consul-terraform-sync"
    version "0.1.2"
  
    if OS.mac?
      url "https://releases.hashicorp.com/consul-terraform-sync/0.1.2/consul-terraform-sync_0.1.2_darwin_amd64.zip"
      sha256 "12abb6df6cb9c522f827d40045be45bb3205c9cfd34f3a5e062255bdaf142bc7"
    end
  
    if OS.mac? && Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for this product
          at this time, however we do plan to support this in the future. The
          darwin_amd64 binary has been installed and may work in
          compatibility mode, but it is not fully supported.
        EOS
      end
    end
  
    if OS.linux? && Hardware::CPU.intel?
      url "https://releases.hashicorp.com/consul-terraform-sync/0.1.2/consul-terraform-sync_0.1.2_linux_amd64.zip"
      sha256 "86f49606ea41d3f46eb04f9defc2746664a3b2a9b025decd1d5f78c2a82ba702"
    end
  
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/consul-terraform-sync/0.1.2/consul-terraform-sync_0.1.2_linux_arm64.zip"
      sha256 "f500802f3ebdde0157cb49d27312276a6d0651007b1f1103c610fa5d19641358"
    end
  
    bottle :unneeded
  
    conflicts_with "consul-terraform-sync"
  
    def install
      bin.install "consul-terraform-sync"
    end
  
    test do
      system "#{bin}/consul-terraform-sync --version"
    end
end
