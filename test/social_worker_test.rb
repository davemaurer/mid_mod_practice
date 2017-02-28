require 'minitest/autorun'
require 'minitest/pride'
require './lib/social_worker'
require './lib/child_welfare_case'

class SocialWorkerTest < Minitest::Test
  def test_it_exists
    sw = SocialWorker.new("Mariko Yamada", "Los Angeles")
    assert_instance_of SocialWorker, sw
  end

  def test_it_has_a_name
    sw = SocialWorker.new("Mariko Yamada", "Los Angeles")
    assert_equal "Mariko Yamada", sw.name
  end

  def test_it_has_a_county
    sw = SocialWorker.new("Mariko Yamada", "Los Angeles")
    assert_equal "Los Angeles", sw.county
  end

  def test_it_has_cases
    sw = SocialWorker.new("Mariko Yamada", "Los Angeles")
    assert_equal [], sw.cases
  end

  def test_it_has_a_caseload
    sw = SocialWorker.new("Mariko Yamada", "Los Angeles")
    assert_equal 0, sw.caseload
  end

  def test_it_adds_a_case
    sw    = SocialWorker.new("Mariko Yamada", "Los Angeles")
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                         "8763 Alameda Street, Los Angeles, CA 90002")

    sw.add_case(cwc_1)
    assert_equal cwc_1, sw.cases.first
    assert_equal 1, sw.caseload
  end

  def test_it_adds_two_cases
    sw    = SocialWorker.new("Mariko Yamada", "Los Angeles")
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                         "8763 Alameda Street, Los Angeles, CA 90002")
    cwc_2 = ChildWelfareCase.new("Jack Sparrow", 78612345821,
                                         "8324 Park Street, Los Angeles, CA 90002")
    sw.add_case(cwc_1)
    sw.add_case(cwc_2)
    assert_equal cwc_2, sw.cases.last
    assert_equal 2, sw.caseload
  end

  def test_it_gives_caseload_by_zip
    sw    = SocialWorker.new("Mariko Yamada", "Los Angeles")
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                 "8763 Alameda Street, Los Angeles, CA 91304")
    cwc_2 = ChildWelfareCase.new("Jack Sparrow", 78612345821,
                                 "8324 Park Street, Los Angeles, CA 90002")
    cwc_3 = ChildWelfareCase.new("Jack Sparrow", 78612345821,
                                 "8324 Park Street, Los Angeles, CA 90002")

    sw.add_case(cwc_1)
    sw.add_case(cwc_2)
    sw.add_case(cwc_3)
    assert_equal ({ 91304 => 1, 90002 => 2 }), sw.caseload_by_zip
  end

end
