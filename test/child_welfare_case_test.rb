require 'minitest/autorun'
require 'minitest/pride'
require './lib/child_welfare_case'

class ChildWelfareCaseTest < MiniTest::Test
  def test_it_has_a_minor
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                 "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal "Jane Doe", cwc_1.minor
  end

  def test_it_has_a_minor_id
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                 "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal 78645863548, cwc_1.minor_id
  end

  def test_it_has_a_zip
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                 "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal 90002, cwc_1.zip
  end

  def test_it_has_an_address
    cwc_1 = ChildWelfareCase.new("Jane Doe", 78645863548,
                                 "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal "8763 Alameda Street", cwc_1.address
  end

end
