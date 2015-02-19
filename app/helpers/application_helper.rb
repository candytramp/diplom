module ApplicationHelper
  def copyrights
    from = 2012
    year = Time.now.year
    res = '&copy; ИВЦ ФГБОУ ВПО &laquo;МГИУ&raquo; '
    res += year > from ? "#{from}&mdash;#{year}" : from.to_s
    res.html_safe
  end

  def flash_class(level)
    classes = ['alert']
    classes << case level
               when :notice
                 'alert-info'
               when :success
                 'alert-success'
               when :error, :alert
                 'alert-danger'
               end
    classes
  end

  def link_to_back
    link_to(icon("angle-left")+' Назад',:back, class: 'btn btn-default')
  end
end
