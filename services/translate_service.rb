require_relative '../models/translate'
require 'rest-client'
require 'json'

class TranslateService
  def initialize(url, key)
    @url = url
    @key = key
  end

  def translate(translate_model)
    body = { key: @key, text: translate_model.text, lang: "#{translate_model.language_from}-#{translate_model.language_to}" }

    response = JSON.parse(send_to_api(body).body)

    if response['code'] == 200
      write_to_file(response['lang'], translate_model.text, response['text'])
    else
      puts 'Erro ao traduzir'
    end
  end

  def send_to_api(body)
    RestClient.get(@url, params: body)
  end

  def write_to_file(lang, original_text, text)
    filename = Time.new.strftime('%m-%d-%Y.%H.%M.%S') + '.txt'

    File.open(filename, 'w') do |line|
      line.puts("Linguagem Tradução #{lang}")
      line.puts('')
      line.puts('Texto Original:')
      line.puts(original_text)
      line.puts('')
      line.puts('Texto Traduzido:')
      line.puts(text)
    end
  end
end
