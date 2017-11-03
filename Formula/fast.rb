class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/f-ast/fast"
  url "https://github.com/f-ast/fast/archive/v0.0.7.tar.gz"
  sha256 "300be2601c032816b33b52b1ee1e6de746e8122aefec45536cefd797caed624c"

  bottle do
    root_url "https://github.com/f-ast/fast/releases/download/v0.0.7"
    cellar :any
    sha256 "5f489e9077b2d08652a8a2c87cceeb6ed3bf50eefad835df79b659880584ec51" => :high_sierra
    sha256 "" => :sierra
    sha256 "" => :el_capitan
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
