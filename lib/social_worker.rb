class SocialWorker
  attr_reader :name, :county, :cases

  def initialize(name, county)
    @name     = name
    @county   = county
    @cases    = []
  end

  def add_case(new_case)
    @cases << new_case
  end

  def caseload
    @cases.length
  end

  def caseload_by_zip
    cases_by_zip = Hash.new(0)
    @cases.each do |c|
      cases_by_zip[c.zip] += 1
    end
    cases_by_zip
  end

end
