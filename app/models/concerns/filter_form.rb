module FilterForm
  def filter_form attrs
    logs = all
    logs = logs.where("id = ?", attrs[:id]) if attrs[:id]

    if attrs[:ip]
      logs = logs.where("remote_ip LIKE ?", "%" + attrs[:ip] + "%")
    end

    if attrs[:get_parameters]
      logs = logs.where("query_string LIKE ?", "%" + attrs[:get_parameters] + "%")
    end

    logs = logs.where("method = ?", attrs[:method]&.upcase) if attrs[:method]

    if attrs[:request_id]
      logs = logs.where("request_id LIKE ?", "%" + attrs[:request_id] + "%")
    end

    if attrs[:path] && attrs[:exact_path] == "1"
      logs = logs.where("path = ?", attrs[:path])
    elsif attrs[:path]
      logs = logs.where("path LIKE ?", "%" + attrs[:path] + "%")
    end

    if attrs[:post_parameters]
      logs = logs.where("request_parameters LIKE ?", "%" + attrs[:post_parameters] + "%")
    end

    logs
  end
end