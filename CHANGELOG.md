# Changelog

* `Unreleased`
  - [PR #30](https://github.com/cortiz/prawn-rails/pull/30) -  Allow rendering in ActionMailer
* `v1.1.0`
  - [#29](https://github.com/cortiz/prawn-rails/pull/29) - Require all installed prawn extensions
  - Removed unnecessary `html_strip` helper method. If you were using this feature, instead use Rails built in `strip_tags(html_str)` or `ActionView::Base.full_sanitizer.sanitize(html_str)`
  - Add legitimate tests

* `v1.0.1`
  - Fix error when using `ActionController.render_to_string`

* `v1.0.0`
  - Support `@filename`
  - Set PDF Title metadata based on `@filename` if not specified
  - Fix for Ruby 1.9.3+
  - Cleanup

* `v0.1.1`
* `v0.1.0`
* `v0.0.2` 
* `v0.0.1`
