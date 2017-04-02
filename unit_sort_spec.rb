require_relative 'unit_sort'

RSpec.describe UnitSort do

  let(:unit_sort) { UnitSort.new('units.txt') }

  describe 'when it reads and sorts the contents of a file' do
    specify { expect(unit_sort.results).to eq(["#1A - Kessenich\n", "#1B - Adams\n",
                                               "#8 - Johnson\n", "#50 - Smith\n",
                                               "#100 - Sanders\n"]) }

  end
end
