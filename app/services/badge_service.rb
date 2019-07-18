class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    get_badge if @test_passage.success_finished?
  end

  def get_badge
    Badge.find_each do |badge|
      @user.badges << badge if send("#{badge.rule}?", badge.parameter) && no_badge?(badge)
    end
  end

  private

  def no_badge?(badge)
    badge.rule == 'success_on_first_try' ? true : !@user.badges.include?(badge)
  end

  def user_passed_tests
    @passed_test_ids ||= @user.test_passages.passed.pluck(:test_id).uniq
  end

  def success_on_first_try?(parameter_stub)
    @user.tests.where(id: @test.id).count == 1
  end

  def success_all_level?(level)
    all_level_tests = Test.by_level(level).ids.uniq
    (all_level_tests - user_passed_tests).empty? if all_level_tests
  end

  def success_category?(category)
    all_category_tests = Test.sort_by_categories(category.capitalize).ids.uniq
    (all_category_tests - user_passed_tests).empty?
  end

end
