class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/f-ast/fast"
  url "https://github.com/f-ast/fast/archive/v0.0.7.tar.gz"
  sha256 "a4fff6e09eeddc6c544f0f9e7fe0c6ea775f14a1935c753338274f79fd2dbd93"

  bottle do
    root_url "https://github.com/f-ast/fast/releases/download/v0.0.7"
    cellar :any
    sha256 "010f75795eb48567f66f7382f115793eb666ca61cf40dbb89aa62e1622a4cf76" => :high_sierra
    sha256 "" => :sierra
    sha256 "8acf4c37ef526ef570238ae8bba1c67b360be418ca0e0f0aa289fb21d4d9bb20" => :el_capitan
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
