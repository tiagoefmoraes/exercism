class NucleicAcid
  def initialize(nucleotides)
    @nucleotides = nucleotides
    nucleotides.split('').uniq.each { |nucleotide| validate_nucleotide(nucleotide) }
  end

  def count(nucleotide)
    validate_nucleotide(nucleotide)
    nucleotides.count(nucleotide)
  end

  def histogram
    specific_nucleobases.each_with_object({}) do |nucleotide, result|
      result[nucleotide] = count(nucleotide)
    end
  end

  protected

  def specific_nucleobases
    NUCLEOBASES
  end

  private

  NUCLEOBASES = %w(A T C G U)

  attr_reader :nucleotides
  
  def validate_nucleotide(nucleotide)
    raise ArgumentError.new(nucleotide) unless NUCLEOBASES.include? nucleotide
  end
end

class DNA < NucleicAcid

  protected

  def specific_nucleobases
    %w(A T C G)
  end

end

class Nucleotide
  def self.from_dna(dna)
    DNA.new(dna)
  end
end