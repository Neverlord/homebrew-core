class Pnpm < Formula
  require "language/node"

  desc "📦🚀 Fast, disk space efficient package manager"
  homepage "https://pnpm.js.org"
  url "https://registry.npmjs.org/pnpm/-/pnpm-5.4.8.tgz"
  sha256 "37f21833de8cd16b1289fa8ec755902676c99334fda6ed98caa83408499fa09e"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "d498288c43a2346c378e88f70d5401cf760ddc6132758d4dadf77f0fb2ad936f" => :catalina
    sha256 "a47d0826c20e99dd4ae33c70321027edb31bd068fb24ed91bbface859702f219" => :mojave
    sha256 "7840b1ed37a8926b315a0f0d3838f11c37c885c320130f97b3b04f7f506e1c3a" => :high_sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/pnpm", "init", "-y"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
