class Timemaniac::Entries
  # List of entries
  attr_accessor :entries

  # Current entry
  attr_reader :current

  def initialize
    @entries = {}
    @current = nil
  end

  def append(entry)
    @entries.store(entry.respond_to?(:name) ? entry.name : length, entry)

    if @current.nil?
      @current = entry
    end
  end

  def remove(key)
    @entries.delete(key) { |key| "Entry #{key} does not exists." }
  end

  def purge
    @entries.clear
  end

  def length
    @entries.length
  end

  def [](key)
    raise ArgumentError.new("#{key} does not exist.") unless @entries.key?(key)
    @entries[key]
  end

  def values
    @entries.values
  end
end