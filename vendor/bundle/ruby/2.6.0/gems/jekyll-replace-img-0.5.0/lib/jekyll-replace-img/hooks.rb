# frozen_string_literal: true

module JekyllReplaceImg
  KEY_CONFIG = "replace_img"

  KEY_RE_IMG      = "re_img"
  KEY_RE_IGNORE   = "re_ignore"
  KEY_REPLACEMENT = "replacement"

  RE_IMG      = "<img\\s*(?<attributes>.*?)\\s*/>"
  RE_IGNORE   = "data-ignore"
  REPLACEMENT = "
    <hy-img %<attributes>s>
      <noscript><img data-ignore %<attributes>s/></noscript>
    </hy-img>"

  RE_DATAURL = %r!src\s*=\s*[""]\s*data:!ix.freeze

  re_img, re_ignore, replacement = nil

  def self.get_config(config, key)
    config[KEY_CONFIG] && config[KEY_CONFIG][key]
  end

  Jekyll::Hooks.register(:site, :after_init) do |site|
    re_img = Regexp.new(
      JekyllReplaceImg.get_config(site.config, KEY_RE_IMG) || RE_IMG,
      Regexp::EXTENDED | Regexp::IGNORECASE | Regexp::MULTILINE
    )

    re_ignore = Regexp.new(
      JekyllReplaceImg.get_config(site.config, KEY_RE_IGNORE) || RE_IGNORE,
      Regexp::EXTENDED | Regexp::IGNORECASE
    )

    replacement = JekyllReplaceImg.get_config(site.config, KEY_REPLACEMENT) || REPLACEMENT
    ENV["JEKYLL_ENV"] == "production" && replacement.gsub!(%r!\n+!, "")
  end

  Jekyll::Hooks.register([:pages, :documents], :post_render) do |page|
    i = 0
    page.output = page.output.gsub(re_img) do |match|
      last_match = Regexp.last_match

      subs = { :i => i }
      last_match.names.each do |name|
        subs[name.intern] = last_match[name]
      end

      if match.index(re_ignore).nil? && match.index(RE_DATAURL).nil?
        i += 1
        replacement % subs
      else
        match
      end
    end
  end
end
