local llm = require('llm')



llm.setup({
  backend = "ollama", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
  model = "codellama:7b",
  api_token = nil,    -- cf Install paragraph
  -- context_window = 4096,
  context_window = 1024,
  tokenizer = {
    -- repository = "codellama/CodeLlama-13b-hf",
  },
  url = "http://localhost:11434/api/generate",
  -- url = nil, -- the http url of the backend

  -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
  request_body = {
    -- Modelfile options for the model you use
    options = {
      temperature = 0.2,
      top_p = 0.95,
    }
  },
  tokens_to_clear = { "<EOT>" },
  fim = {
    enabled = true,
    prefix = "<PRE> ",
    middle = " <MID>",
    suffix = " <SUF>",
  },
  -- accept_keymap = "<Tab>",
  -- dismiss_keymap = "<S-Tab>",
  accept_keymap = "<LEADER><Tab>",
  dismiss_keymap = "<S-Tab>",
})
