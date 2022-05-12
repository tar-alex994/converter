class Log < ApplicationRecord
  def self.filtered_logs attributes
    logs = Log.order(:created_at)

    if attributes[:id] && !attributes[:id].strip.empty?
      logs = logs.where("id = ?", attributes[:id])
    end
    if attributes[:ip] && !attributes[:ip].strip.empty?
      logs = logs.where("remote_ip LIKE ?", "%" + attributes[:ip] + "%")
    end
    if attributes[:get_parameters] && !attributes[:get_parameters].strip.empty?
      logs = logs.where("query_string LIKE ?", "%" + attributes[:get_parameters] + "%")
    end
    if attributes[:method] && !attributes[:method].strip.empty?
      logs = logs.where("method = ?", attributes[:method]&.upcase)
    end
    if attributes[:request_id] && !attributes[:request_id].strip.empty?
      logs = logs.where("request_id LIKE ?", "%" + attributes[:request_id] + "%")
    end
    if attributes[:path] && !attributes[:path].strip.empty?
      logs = logs.where("path LIKE ?", "%" + attributes[:path] + "%")
    end
    if attributes[:path] && attributes[:exact_match] == "1" && !attributes[:path].strip.empty?
      logs = logs.where("path = ?", attributes[:path])
    end
    if attributes[:post_parameters] && !attributes[:post_parameters].strip.empty?
      logs = logs.where("request_parameters LIKE ?", "%" + attributes[:post_parameters] + "%")
    end

    logs
  end
end
