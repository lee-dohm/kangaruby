
describe 'Constants' do
  it 'has a pointer to the fonts directory' do
    expect(KangaRuby::FONTS_DIR).to eq(File.expand_path('../../../fonts', __FILE__))
  end

  it 'supplies acceptable line styles' do
    expect(KangaRuby::STYLES.count).to eq(2)
    expect(KangaRuby::STYLES).to include(:solid)
    expect(KangaRuby::STYLES).to include(:dotted)
  end
end
