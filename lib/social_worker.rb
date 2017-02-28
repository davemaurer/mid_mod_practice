class SocialWorker
  attr_reader :name, :county, :cases

  def initialize(name, county)
    @name   = name
    @county = county
    @cases = []
  end

  def caseload
    @cases.count
  end

  def add_case(cw_case)
    @cases << cw_case
  end

  def caseload_by_zip
    # grouped_cases = @cases.group_by { |c| c.zip }
    # grouped_cases.each { |k, v| grouped_cases[k] = v.count }
    grouped_cases = Hash.new(0)
    @cases.each do |c|
      grouped_cases[c.zip] += 1
    end
    grouped_cases
  end
end
