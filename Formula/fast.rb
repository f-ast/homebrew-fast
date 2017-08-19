class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/f-ast/fast"
  url "https://github.com/f-ast/fast/archive/v0.0.5.tar.gz"
  sha256 "ce512e18fab5f4536770e4b52ce86442bab3f854a57f52a40739dea66d0a104c"

  bottle do
    root_url "https://github.com/f-ast/fast/releases/download/v0.0.5"
    cellar :any
    sha256 "6a7931c3b579ef318d34fb2a61e38485792b22432257584379431835978d6267" => :sierra
    sha256 "1e77ab41415d37827738aac32ab28ee756a78befbb9576f0f4b3ef8ca6cac815" => :el_capitan
  end

  depends_on "flatbuffers" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf" => :build
  # depends_on "srcml" => :run
  depends_on "libxml2"
  depends_on "antlr"
  depends_on "antlr4-cpp-runtime"
  depends_on "lcov"
  depends_on "jq"

  def install
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"Hello.java").write <<-EOS

public class Hello {
    public static void main(String args[]) {
        System.out.println("Hello, world!");
    }
}
    EOS

    exec "#{bin}/fast", "Hello.java", "Hello.pb"
  end
end
