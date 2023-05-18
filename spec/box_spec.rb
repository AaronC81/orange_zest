RSpec.describe OrangeZest::Box do
  it 'has a centre' do
    expect(Box.new(Point.new(10, 50), 30, 50).centre).to eq Point.new(10 + 30 / 2, 50 + 50 / 2)
  end
end
