class ChildWelfareCase
  attr_reader :minor, :minor_id

  def initialize(minor_name, id, address)
    @address = address
    @minor = minor_name
    @minor_id = id
  end

  def zip
    @address.split(" ").last.to_i
  end

  def address
    @address.split(", ").first
  end
end
