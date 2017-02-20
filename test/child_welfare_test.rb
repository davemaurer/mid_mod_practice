require 'minitest/autorun'
require 'minitest/pride'
require './lib/child_welfare_case'
require './lib/social_worker'

class ChildWelfareCaseTest < MiniTest::Test

  def test_it_returns_an_address
    cw = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal "8763 Alameda Street", cw.address
  end

  def test_it_has_a_minor_name
    cw = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal "Jane", cw.minor
  end

  def test_it_has_an_id
    cw = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal 8475767393575, cw.minor_id
  end

  def test_it_has_a_zip
    cw = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    assert_equal 90002, cw.zip
  end

  def test_adding_it_to_a_social_worker
    cw = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    social_worker = SocialWorker.new("Mariko Yamada", "Los Angeles")
    social_worker.add_case(cw)
    assert_equal cw, social_worker.cases.first
  end

  def test_adding_another_case
    cw1 = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    cw2 = ChildWelfareCase.new("Jack", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    social_worker = SocialWorker.new("Mariko Yamada", "Los Angeles")
    social_worker.add_case(cw1)
    social_worker.add_case(cw2)
    assert_equal cw1, social_worker.cases.first
    assert_equal cw2, social_worker.cases.last
  end

  def test_adding_a_case_increments_social_worker_caseload
    cw = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    social_worker = SocialWorker.new("Mariko Yamada", "Los Angeles")
    social_worker.add_case(cw)
    assert_equal 1, social_worker.caseload
  end

  def test_adding_more_than_one_case
    cw1 = ChildWelfareCase.new("Jane", 8475767393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    cw2 = ChildWelfareCase.new("Jack", 8444257393575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    cw3 = ChildWelfareCase.new("Joan", 3448673693575,
                              "8763 Alameda Street, Los Angeles, CA 90002")
    social_worker = SocialWorker.new("Mariko Yamada", "Los Angeles")
    social_worker.add_case(cw1)
    social_worker.add_case(cw2)
    social_worker.add_case(cw3)
    assert_equal 3, social_worker.caseload
  end

  def test_social_worker_gives_caseload_by_zip
    cw1 = ChildWelfareCase.new("Jane", 8475767393575,
                               "8763 Alameda Street, Los Angeles, CA 90112")
    cw2 = ChildWelfareCase.new("Jack", 8444257393575,
                               "8763 Alameda Street, Los Angeles, CA 80002")
    cw3 = ChildWelfareCase.new("Joan", 3448673693575,
                               "8763 Alameda Street, Los Angeles, CA 80002")
    social_worker = SocialWorker.new("Mariko Yamada", "Los Angeles")
    social_worker.add_case(cw1)
    social_worker.add_case(cw2)
    social_worker.add_case(cw3)
    assert_equal ({90112 => 1, 80002 => 2}), social_worker.caseload_by_zip
  end

end
