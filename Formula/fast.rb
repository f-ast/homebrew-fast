class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/f-ast/fast"
  url "https://github.com/f-ast/fast/archive/v0.0.4.tar.gz"
  sha256 "d6fe1e5cedd388a396b05ac90590a60a08af87d4b337f8d23c8b0cbb68e37d9a"

  bottle do
    root_url "https://github.com/f-ast/fast/releases/download/v0.0.4"
    cellar :any
    sha256 "" => :sierra
    sha256 "1e77ab41415d37827738aac32ab28ee756a78befbb9576f0f4b3ef8ca6cac815" => :el_capitan
  end

  depends_on "flatbuffers" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf" => :build
  depends_on "srcml" => :run
  depends_on "libxml2"
  depends_on "antlr"
  depends_on "antlr4-cpp-runtime"
  depends_on "lcov"

  def install
    args = [
      "--prefix=#{prefix}",
    ]
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
