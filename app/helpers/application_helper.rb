module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Проект', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message(key)
    {
        notice: 'alert-info',
        alert: 'alert-danger'
    }[key.to_sym]
  end

  def not_gists_page?
    request.original_url.exclude?('/gists')
  end
end
