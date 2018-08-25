class Minizinc < Formula
  desc "Medium-level constraint modeling language"
  homepage "https://www.minizinc.org/"
  url "https://github.com/MiniZinc/libminizinc/archive/2.2.0.tar.gz"
  sha256 "3c885cbf17bca66947a9c13e30bd46308ac057030238f65145d864b2dca283db"
  head "https://github.com/MiniZinc/libminizinc.git", :branch => "develop"

  bottle do
    cellar :any_skip_relocation
    sha256 "845c90c782f19894a72e3c6b3022d9aff95bbffb35a126ee4aa022c2274bd794" => :mojave
    sha256 "970176e584ec4e246b2e2435e14f95037a2a3d9f607c6ff29d6e024ba5371e8a" => :high_sierra
    sha256 "d4d6ce59e834a8c3429ae4d1ce46063148d7c07b9fc02aa30d4cb8b27d2cf469" => :sierra
    sha256 "d76a0ec9eac191b1aee519540dcff60a40400099f5c1a3b0fbf5880340c5bc5e" => :el_capitan
  end

  depends_on :arch => :x86_64
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "cmake", "--build", ".", "--target", "install"
    end
  end

  test do
    system bin/"mzn2doc", share/"examples/functions/warehouses.mzn"
  end
end
