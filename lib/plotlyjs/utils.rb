module Plotlyjs
  module Utils
    def self.deep_merge(hash_a, hash_b)
      hash_a = hash_a.dup
      hash_b.each_pair do |k, v|
        tv = hash_a[k]
        hash_a[k] = tv.is_a?(Hash) && v.is_a?(Hash) ? deep_merge(tv, v) : v
      end
      hash_a
    end
  end
end
