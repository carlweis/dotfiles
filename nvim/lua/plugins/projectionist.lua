-- Project Configuration

return {
  'tpope/vim-projectionist',
  dependencies = 'tpope/vim-dispatch',
  config = function()
    vim.g.projectionist_heuristics = {
      ['Gemfile'] = {
        ['*'] = {
          start = 'rails server',
          console = 'rails console',
        },
        ['app/**/*.rb'] = {
          type = 'source',
          alternate = {
            'spec/{}_spec.rb',
          },
        },
        ['spec/**/*_spec.rb'] = {
          type = 'test',
          alternate = 'app/{}.rb',
        },
        ['app/models/*.rb'] = {
          type = 'model',
        },
        ['app/controllers/*.rb'] = {
          type = 'controller',
        },
        ['config/routes.rb'] = {
          type = 'route',
        },
        ['db/migrate/*.rb'] = {
          type = 'migration',
        },
      },
      ['lib/**/*.rb'] = {
        type = 'source',
        alternate = {
          'spec/lib/{}_spec.rb',
        },
      },
      ['spec/lib/**/*_spec.rb'] = {
        type = 'test',
        alternate = 'lib/{}.rb',
      },
    }
  end,
}

