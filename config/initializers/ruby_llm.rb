RubyLLM.configure do |config|
  config.openai_api_key = ENV["AZURE_OPENAI_KEY"]
  config.openai_api_base = "https://models.inference.ai.azure.com"
end