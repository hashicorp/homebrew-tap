class ConsulTemplate < Formula
    desc "Consul-Template"
    homepage "https://github.com/hashicorp/consul-template"
    version "0.26.0"
  
    if OS.mac?
      url "https://releases.hashicorp.com/consul-template/0.26.0/consul-template_0.26.0_darwin_amd64.zip"
      sha256 "b7eec207d96dfb1bc3f84ef13725326469bbfa28a94fe1613176a63ba024db7c"
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
      url "https://releases.hashicorp.com/consul-template/0.26.0/consul-template_0.26.0_linux_amd64.zip"
      sha256 "d4b1d8dc46289a4bdbb73301cd1dbdd9b41eddcab4103f006c5bf9637f7e4381"
    end
  
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/consul-template/0.26.0/consul-template_0.26.0_linux_arm64.zip"
      sha256 "9e70de2fb05e060a2b573dd189dd20bc5c4ef0ae39ad3d717d9546ff03545d36"
    end
  
    bottle :unneeded
  
    conflicts_with "consul-template"
  
    def install
      bin.install "consul-template"
    end
  
    test do
      system "#{bin}/consul-template --version"
    end
end
