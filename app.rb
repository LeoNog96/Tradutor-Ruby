require_relative './services/translate_service'
require_relative './models/translate'

url = 'https://translate.yandex.net/api/v1.5/tr.json/translate'
token = 'trnsl.1.1.20200415T165354Z.a7b7175d60815cc6.39444b56cef8ab5ab3fef9790312332d767d52d4'

service = TranslateService.new(url, token)

puts 'Digite qual a linguagem a ser traduzida:'
lang_from = gets.chomp

puts 'Digite o texto a ser traduzido:'
text = gets.chomp

puts 'Digite para qual linguagem será traduzida:'
lang_to = gets.chomp

translate_model = Translate.new(text, lang_from, lang_to)

puts service.translate(translate_model)
