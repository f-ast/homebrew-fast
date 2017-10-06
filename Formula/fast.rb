class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/f-ast/fast"
  url "https://github.com/f-ast/fast/archive/v0.0.6.tar.gz"
  sha256 "f9ecb7082bfc14e6cfc3284a05c745f0254594f513b6cbd7303f4781e183597d"

  bottle do
    root_url "https://github.com/f-ast/fast/releases/download/v0.0.6"
    cellar :any
    sha256 "b3e43a220d1c7c2095834a1017011dc75fb8ac542fa2572200f9e7dd6dc65b3b" => :high_sierra
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
