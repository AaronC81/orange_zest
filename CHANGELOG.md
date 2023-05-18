## [0.2.0] - 2023-05-18

### Added

- Add `Component#anon` for creating one-off components
- Add `Box#centre` for getting the centre point of a bounding box
- Add `Point#line_to` for sampling points on a line between two points
- Alias `Point#[]` to `Point#new`
- Override `Point#to_s` and `Point#inspect` to be more concise
- Scalars can now be added or subtracted with a `Point` to equivalently affect all of its elements
- Add `Animation#placeholder` for creating a static, solid-colour animation

### Fixed

- `Entity#bounding_box` now reflects scaling in its width and height

## [0.1.0] - 2022-08-27

- Initial release
