class Comum < SitePrism::Page
    @@store_id = 'AMERICANAS'

    def exists?(selector, path, matcher, wait_time)
      sleep(wait_time)
      r = false
      if (selector.upcase == "CSS")
        if matcher.has_css?(path)
          r = true
        else
          r = false
        end
      end
      if (selector.upcase == "XPATH")
        if matcher.has_css?(path)
          r = true
        else
          r = false
        end
    end
    return r
  end
end