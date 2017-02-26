class Redis

  def cache(key, expire = nil)
    if expire == 0
      return yield(self)
    end

    if (value = get(key)).nil?
      value = yield(self)
      set(key, value)
      expire(key, expire) if expire
      value
    else
      value
    end
  end

end
