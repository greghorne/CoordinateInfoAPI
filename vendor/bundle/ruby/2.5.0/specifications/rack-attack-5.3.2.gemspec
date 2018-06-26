# -*- encoding: utf-8 -*-
# stub: rack-attack 5.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rack-attack".freeze
  s.version = "5.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/kickstarter/rack-attack/issues", "changelog_uri" => "https://github.com/kickstarter/rack-attack/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/kickstarter/rack-attack" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aaron Suggs".freeze]
  s.date = "2018-06-25"
  s.description = "A rack middleware for throttling and blocking abusive requests".freeze
  s.email = "aaron@ktheory.com".freeze
  s.homepage = "https://github.com/kickstarter/rack-attack".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--charset=UTF-8".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Block & throttle abusive requests".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>.freeze, [">= 0"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.2"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_development_dependency(%q<minitest-stub-const>.freeze, ["~> 0.6"])
      s.add_development_dependency(%q<rack-test>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.57.2"])
      s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
      s.add_development_dependency(%q<byebug>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<actionpack>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    else
      s.add_dependency(%q<rack>.freeze, [">= 0"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 2.2"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_dependency(%q<minitest-stub-const>.freeze, ["~> 0.6"])
      s.add_dependency(%q<rack-test>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.57.2"])
      s.add_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
      s.add_dependency(%q<byebug>.freeze, ["~> 10.0"])
      s.add_dependency(%q<actionpack>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rack>.freeze, [">= 0"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 2.2"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
    s.add_dependency(%q<minitest-stub-const>.freeze, ["~> 0.6"])
    s.add_dependency(%q<rack-test>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.57.2"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9.1"])
    s.add_dependency(%q<byebug>.freeze, ["~> 10.0"])
    s.add_dependency(%q<actionpack>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
  end
end
