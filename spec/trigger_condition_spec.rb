RSpec.describe OrangeZest::TriggerCondition do
  def logic_generator
    x = [false, true, false, false, true, true, true, false, true, true, false, false, false]
    ->{ x.shift }
  end

  it 'triggers on rises and falls' do
    gen = logic_generator
    results = []
    until (x = gen.()).nil?
      results << TriggerCondition.watch(x)
    end

    on = TriggerCondition::ON
    off = TriggerCondition::OFF
    expect(results).to eq [
      nil, on, off, nil, on, nil, nil, off, on, nil, off, nil, nil
    ]
  end
end
