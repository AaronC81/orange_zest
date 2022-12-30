# OrangeZest

OrangeZest is a **lightweight layer on top of the excellent
[Gosu game library](https://www.libgosu.org/)**.

I absolutely love Gosu because it provides the perfect level of abstraction for you to approach a
game's architecture however you like. _This_ is the architecture that I've enjoyed using for the
[last](https://github.com/AaronC81/pet-peeve)
[three](https://github.com/AaronC81/the-arcane-king)
[games](https://github.com/AaronC81/mini-mall-maker)
I've created for the Gosu Game Jam, and I've finally decided to break it out into a separate gem to
make it more reusable.

OrangeZest encourages using OOP rather than ECS, although it's lightweight and unopinionated enough
that you might be able to implement ECS on top of it. (The words "component" and "entity" in
OrangeZest _do not_ refer to the ECS concepts - they just happen to fit OrangeZest's concepts too!)

OrangeZest provides:

- _Components_, objects which can be instantiated into the game world to provide behaviour
- _Entities_, a subclass of components which has a position and animation
- _Groups_, to bundle together related components into one
- A very simple animation system
- Simple mathematical primitives (points and boxes)

## Installation

This gem is available on RubyGems as `orange_zest`. Add it to your Gemfile as `gem 'orange_zest'`,
or install it globally with `gem install orange_zest`.

## Getting Started

See the `examples` directory for some sample scripts which use OrangeZest. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/AaronC81/orange_zest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/AaronC81/orange_zest/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OrangeZest project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/AaronC81/orange_zest/blob/main/CODE_OF_CONDUCT.md).
