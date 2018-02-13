require('pry-byebug')
require_relative('models/bounty.rb')

bounty1 = Bounty.new({
  'name' => 'Bucky',
  'bounty_value' => 10000,
  'homeworld' => 'UAF Republic',
  'species' => 'hare'
  })

  bounty2 = Bounty.new({
    'name' => 'Splinter',
    'bounty_value' => 15000,
    'homeworld' => 'planet of the turtles',
    'species' => 'rat'
    })

    bounty3 = Bounty.new({
      'name' => 'Vinnie',
      'bounty_value' => 20000,
      'homeworld' => 'mars',
      'species' => 'mouse'
      })

  binding.pry

  nil
