module PostsHelper
    def convertToJPY(price)
      "#{price.to_s(:delimited, delimiter: ',')}"
    end
end
