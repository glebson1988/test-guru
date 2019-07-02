class GistQuestionService

  def initialize(question, client = octokit_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def octokit_client
    client = Octokit::Client.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
  end

  def gist_params
    {
        description: I18n.t('services.gist_question_service.desc', title: @test.title),
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
