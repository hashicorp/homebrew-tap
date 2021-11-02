class ConsulECS < Formula
    desc "Consul ECS"
    homepage "https://github.com/hashicorp/consul-ecs"
    version "0.2.0-beta2"
  
    if OS.mac?
      url "https://releases.hashicorp.com/consul-ecs/0.2.0-beta2/consul-ecs_0.2.0-beta2_darwin_amd64.zip"
      sha256 "eff66e3f8c23b964d2d22ed2e18de7cc31d7a8b999fe58d17745bf54ce43ab88"
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
      url "https://releases.hashicorp.com/consul-ecs/0.2.0-beta2/consul-ecs_0.2.0-beta2_linux_amd64.zip"
      sha256 "b7a404a446d6a5746f53aea6e468170d361225ff3ed704bfadc70257905fe8d4"
    end
  
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://releases.hashicorp.com/consul-ecs/0.2.0-beta2/consul-ecs_0.2.0-beta2_linux_arm64.zip"
      sha256 "85a464d6c55ba81144d3e80ccd510327a65bf151511bcf07f700a4ccacaebc11"
    end
  
    conflicts_with "consul-ecs"
  
    def install
      bin.install "consul-ecs"
    end
  
    test do
      system "#{bin}/consul-ecs --version"
    end
  end
  