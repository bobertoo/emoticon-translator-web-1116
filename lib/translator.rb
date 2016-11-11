require "yaml"

def load_library(library)
  emoticons = YAML.load_file(library)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |keyz, valz|
    result["get_meaning"][valz[1]] = keyz
    result["get_emoticon"][valz[0]] = valz[1]
  end
  result
end

def get_japanese_emoticon(library, emoticon)
  translation = ""
  emoticons = load_library(library)
  emoticons["get_emoticon"].each do |keyz, valz|
    if emoticon == keyz
      translation = valz
    end
  end
  if translation == ""
    translation = "Sorry, that emoticon was not found"
  end
  translation
end

def get_english_meaning(library, emoticon)
  emoticons = load_library(library)
  translation = ""
  emoticons["get_meaning"].each do |keyz, valz|
    if emoticon == keyz
      translation = valz
    end
  end
  if translation == ""
    translation = "Sorry, that emoticon was not found"
  end
  translation
end
