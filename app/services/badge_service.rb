class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.select { |badge| send("#{badge.rule}?", badge.parameter) if no_badge?(badge) }
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
    return unless @test.level == level.to_i
    all_level_tests = Test.by_level(level.to_i).ids.uniq
    (all_level_tests - user_passed_tests).empty? if all_level_tests
  end

  def success_category?(category)
    return unless @test.category.title == category
    all_category_tests = Test.sort_by_categories(category.capitalize).ids.uniq
    (all_category_tests - user_passed_tests).empty?
  end
end
