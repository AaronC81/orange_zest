RSpec.describe OrangeZest::Point do
  it 'can be added' do
    expect(Point.new(1, 2, 3) + Point.new(4, 5, 6)).to eq Point.new(5, 7, 9)
  end

  it 'can be negated' do
    expect(-Point.new(1, 2, 3)).to eq Point.new(-1, -2, -3)
  end

  it 'can be subtracted' do
    expect(Point.new(4, 5, 6) - Point.new(1, 3, 5)).to eq Point.new(3, 2, 1)
  end

  it 'has working #hash' do
    expect(Point.new(1, 2, 3).hash).to eq Point.new(1, 2, 3).hash
  end
end
