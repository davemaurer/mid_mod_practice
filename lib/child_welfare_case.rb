class ChildWelfareCase
  attr_reader :minor, :minor_id

  def initialize(minor, minor_id, total_address)
    @minor = minor
    @minor_id = minor_id
    @total_address = total_address
  end

  def zip
    zip_string = @total_address.split(" ")[-1]
    zip_string.to_i
  end

  def address
    @total_address.split(", ")[1]
  end
end
