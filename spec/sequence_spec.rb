require 'rspec'
require 'sequence'

describe 'Sequence' do
  let(:single) {[1]}
  let(:simple_increasing) {[1, 2, 3]}
  let(:decrease_beginning) {[5, 1, 2, 3]}
  let(:decrease_beginning_failed) {[5, 2, 1]}
  let(:decrease_middle_pop_current) {[1, 2, 6, 7, 4, 10]}
  let(:decrease_middle_pop_current_failed) {[1, 2, 6, 7, 4, 10, 8]}
  let(:decrease_middle_pop_prev) {[1, 2, 5, 3, 4]}
  let(:decrease_middle_pop_prev_failed) {[1, 4, 5, 3, 4]}
  let(:decrease_middle_pop_prev_failed_after) {[1, 2, 5, 3, 2]}
  let(:decrease_end) {[1, 3, 65, 85, 3]}
  let(:decrease_twice) {[1, 2, 5, 3, 4, 3, 7]}
  let(:same_beginning) {[1, 1, 2, 3, 4]}
  let(:same_middle) {[1, 2, 3, 3, 4]}
  let(:same_end) {[1, 2, 3, 4, 4]}

  it 'return true for single' do
    expect(Sequence.new(single).almost_increasing_sequence?).to be true
  end
  it 'return true for simple_increasing' do
    expect(Sequence.new(simple_increasing).almost_increasing_sequence?).to be true
  end
  it 'return true for decrease_beginning' do
    expect(Sequence.new(decrease_beginning).almost_increasing_sequence?).to be true
  end
  it 'return false for decrease_beginning_failed' do
    expect(Sequence.new(decrease_beginning_failed).almost_increasing_sequence?).to be false
  end
  it 'return true for decrease_middle_pop_current' do
    expect(Sequence.new(decrease_middle_pop_current).almost_increasing_sequence?).to be true
  end
  it 'return false for decrease_middle_pop_current_failed' do
    expect(Sequence.new(decrease_middle_pop_current_failed).almost_increasing_sequence?).to be false
  end
  it 'return true for decrease_middle_pop_prev' do
    expect(Sequence.new(decrease_middle_pop_prev).almost_increasing_sequence?).to be true
  end
  it 'return false for decrease_middle_pop_prev_failed' do
    expect(Sequence.new(decrease_middle_pop_prev_failed).almost_increasing_sequence?).to be false
  end
  it 'return false for decrease_middle_pop_prev_failed_after' do
    expect(Sequence.new(decrease_middle_pop_prev_failed_after).almost_increasing_sequence?).to be false
  end
  it 'return true for decrease_end' do
    expect(Sequence.new(decrease_end).almost_increasing_sequence?).to be true
  end
  it 'return false for decrease_twice' do
    expect(Sequence.new(decrease_twice).almost_increasing_sequence?).to be false
  end
  it 'return true for same_beginning' do
    expect(Sequence.new(same_beginning).almost_increasing_sequence?).to be true
  end
  it 'return true for same_middle' do
    expect(Sequence.new(same_middle).almost_increasing_sequence?).to be true
  end
  it 'return true for same_end' do
    expect(Sequence.new(same_end).almost_increasing_sequence?).to be true
  end
end