require "open3"
require "rbconfig"

RSpec.describe "評価コードのRails 8.1互換性" do
  it "未実装を合格にせず、評価コード自体の例外も発生させないこと" do
    script = File.expand_path("../scripts/verify_evaluation", __dir__)
    stdout, stderr, status = Open3.capture3(RbConfig.ruby, script)

    puts stdout
    warn stderr unless stderr.empty?

    expect(status).to be_success
  end
end
