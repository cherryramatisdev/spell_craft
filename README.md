# Spell craft

The goal for this project is to provide a CLI that facilite boilerplate generation on ruby projects such as:

1. Adding or removing support for REPL (IRB or pry)
2. Adding or removing support for tests (RSpec, Minitest)
3. Adding or removing auto loading/requiring (using zeitwerk)

In the future, this project should enable configuration of [dry-rb](https://dry-rb.org) related gems such as *dry-system*, *dry-cli*, etc...

## Commands

- [ ] `add`: A branch to add configurations
    - [ ] `repl`: This command should prompt to choose from IRB or pry and add correct configuration to `bin/console`, for pry it should install common extensions like pry reload and pry rescue.
    - [ ] `autoload`: This command should add the configuration necessary to use zeitwerk on the current project.
- [ ] `remove`: A branch to remove configurations
