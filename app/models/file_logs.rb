class FileLogs
  def initialize(path)
    @path = Rails.application.root + path
  end

  def all
    File.readlines(@path)
  end

  def filter_logs str
    if str.class == String
      all.select { |log| log.downcase.include?(str.downcase) }
    else
      all
    end
  end
end