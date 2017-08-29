class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/f-ast/fast"
  url "https://github.com/f-ast/fast/archive/v0.0.5.tar.gz"
  sha256 "bbd196722953961164cd935f8fa359acbe73200bb27e48625b56456bf4725d73"

  bottle do
    root_url "https://github.com/f-ast/fast/releases/download/v0.0.5"
    cellar :any
    sha256 "19ae488ee4e8bf42daed58bb4f6db6ab9b29e90a66b7bdf02adb904030cc6be6" => :sierra
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
