# Changelog

* `Unreleased` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.4.2...master)
  - Nothing yet

* `v1.4.2` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.4.1...v1.4.2)
  - Remove dependency on `railsties` and instead only depend on `actionview`

* `v1.4.1` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.4.0...v1.4.1)
  - [7575606](https://github.com/cortiz/prawn-rails/commit/7575606) - Complete switch to Railsties from [PR #41](https://github.com/cortiz/prawn-rails/pull/41)

* `v1.4.0` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.3.0...v1.4.0)
  - [PR #41](https://github.com/cortiz/prawn-rails/pull/41) - Depend on `railsties` instead of `rails` gem to avoid pulling in unnecessary dependencies such as action_cable, etc.

* `v1.3.0` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.2.1...v1.3.0)
  - [PR #40](https://github.com/cortiz/prawn-rails/pull/40) - Add `:filename` and `:disposition` options for `prawn_document
  - [PR #40](https://github.com/cortiz/prawn-rails/pull/40) - Do not override existing`Content-Disposition` headers

* `v1.2.1` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.2.0...v1.2.1)
  - [PR #39](https://github.com/cortiz/prawn-rails/pull/39) - Fix Rails 6 deprecation warning for single arity template handlers
  - Remove unnecessary option logic from `prawn_document` method

* `v1.2.0` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.1.0...v1.2.0)
  - [PR #31](https://github.com/cortiz/prawn-rails/pull/31) - Use Prawn::Document.extensions in favor of custom plug-in loading. This removes all changes made in PR #29 and should behave much more appropriately now.
  - [Undo PR #29](https://github.com/cortiz/prawn-rails/pull/31) - Use Prawn::Document.extensions in favor of custom plug-in loading
  - [PR #30](https://github.com/cortiz/prawn-rails/pull/30) -  Allow rendering in ActionMailer

* `v1.1.0` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.0.2...v1.1.0)
  - [PR #29](https://github.com/cortiz/prawn-rails/pull/29) - Require all installed prawn extensions
  - Removed unnecessary `html_strip` helper method. If you were using this feature, instead use Rails built in `strip_tags(html_str)` or `ActionView::Base.full_sanitizer.sanitize(html_str)`
  - Add legitimate tests

* `v1.0.1` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.0.0...v1.0.1)
  - Fix error when using `ActionController.render_to_string`

* `v1.0.0` - [View Diff](https://github.com/cortiz/prawn-rails/compare/v1.0.0...v0.1.1)
  - Support `@filename`
  - Set PDF Title metadata based on `@filename` if not specified
  - Fix for Ruby 1.9.3+
  - Cleanup

* `v0.1.1`
* `v0.1.0`
* `v0.0.2`
* `v0.0.1`
