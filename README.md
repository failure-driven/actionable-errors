<h1 align="center">Actionable Errors</h1>

<div align="center">

[slides](https://failure-driven.github.io/actionable-errors/)

</div>

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

<h1 align="center">Actionable Errors</h1>

**Slides** https://failure-driven.github.io/actionable-errors/

## TODO

- originally brought into rails with https://github.com/rails/rails/pull/36043
- Actionable Errors for Active Storage and Action Mailbox as PR waiting to be
  merged https://github.com/rails/rails/pull/36071
  - hit http://localhost:3000/rails/conductor/action_mailbox/inbound_emails/

- [ ] what are the inbuilt actionable errors
- [ ] how actionable errors are implemented `rails middleware`
- [ ] how to add a new error on no route
- [ ] what are all the possible errors
  - ActiveRecord::NoDatabaseError
  - Routing Error
    - no default route for test
    ```
    ActionController::RoutingError
    ```
    but get on rails page in dev
    - in test
    ```
    Puma caught this error: No route matches [GET] "/ggg" (ActionController::RoutingError)
    ```
  - Unknown action - not in below list
  ```
  AbstractController::ActionNotFound
  ```
  - which gets wrapped with actionpack/lib/action_dispatch/middleware/exception_wrapper.rb
  - looked at production
  ```
  sudo -u michael createuser --interactive
  Enter name of role to add: actionable_errors
  Shall the new role be a superuser? (y/n) y

  $ RAILS_ENV=production bin/rails db:create
  Created database 'actionable_errors_production'
  ```
  - but does not work with better errors gem
  - take a look at all errors found in rails?
  ```
  ag ' raise .*Error' . | awk -F 'raise' '{print $2}' | awk  '{print $1}' | sort | uniq | pbcopy
  ```
  which found the following errors
  ```
    ActiveSupport::Duration::ISO8601Parser::ParsingError
    NoMethodError
    WrongEncodingError
    AbstractController::DoubleRenderError
    ArgumentError
    StandardError
    AbstractController::Helpers::MissingHelperError
    ActionController::RespondToMismatchError
    ActionController::RoutingError
    ActionController::UrlGenerationError
    ActionControllerError
    ActionDispatch::Http::Parameters::ParseError
    ActionDispatch::IllegalStateError
    ActionDispatch::Session::SessionRestoreError
    ActionView::Template::Error
    ActiveJob::DeserializationError
    ActiveModel::ForbiddenAttributesError
    ActiveModel::MissingAttributeError
    ActiveModel::RangeError
    ActiveRecord::DeleteRestrictionError
    ActiveRecord::EagerLoadPolymorphicError
    ActiveRecord::EnvironmentMismatchError
    ActiveRecord::NoDatabaseError
    ActiveRecord::PendingMigrationError
    ActiveRecord::ProtectedEnvironmentError
    ActiveRecord::ReadOnlyError
    ActiveRecord::StaleObjectError
    ActiveRecord::TransactionIsolationError
    ActiveRecordError
    ActiveStorage::FileNotFoundError
    ActiveStorage::IntegrityError
    ActiveStorage::InvariableError
    ActiveStorage::UnpreviewableError
    ActiveStorage::UnrepresentableError
    ArgumentError
    AssociationNotFoundError
    BadError
    Capybara::CapybaraError
    ColumnNotSerializableError
    ConcurrentMigrationError
    ConfigurationError
    ConnectionTimeoutError
    CustomActionableError
    CustomAppException
    DRb::DRbConnError
    Dalli::DalliError
    DangerousAttributeError
    DelegationError
    DeserializationError
    DummyError
    DuplicateMigrationNameError
    DuplicateMigrationVersionError
    EOFError
    EagerLoadPolymorphicError.new(reflection)
    EmptyJoinError
    Error
    ErrorFromAttributeWriter
    ErrorLoadingSite
    ErrorToRescue
    ExclusiveConnectionTimeoutError
    Fixture::FixtureError
    Fixture::FormatError
    HasManyThroughAssociationNotFoundError
    HasManyThroughAssociationPointlessSourceTypeError
    HasManyThroughAssociationPolymorphicSourceError
    HasManyThroughAssociationPolymorphicThroughError
    HasManyThroughOrderError.new(active_record
    HasManyThroughSourceAssociationNotFoundError
    HasOneAssociationPolymorphicThroughError
    IOError
    IllegalMigrationNameError
    InterceptedErrorInstance
    InvalidIdentifiersError
    InvalidNumberError
    InverseOfAssociationNotFoundError
    IpSpoofAttackError
    IrreversibleOrderError
    KeyError
    LessonError
    LoadError
    MissingContentError
    MissingKeyError
    MockDatabaseError
    MultiparameterAssignmentErrors
    MyError
    NameError
    Net::OpenTimeout
    NoDatabaseError
    NoEnvironmentInSchemaError
    NoMethodError
    NonInferrableChannelError
    NonInferrableConnectionError
    NonInferrableMailerError
    NotImplementedError
    OopsError
    OtherError
    PG::Error
    ParseError
    ParsingError
    Rack::Utils::InvalidParameterError
    RangeError
    Redis::BaseConnectionError
    RoutingError
    RuntimeError
    SafeConcatError
    SerializationError,
    SomeCustomError
    StandardError
    SyntaxErrorInTemplate
    Template::Error
    TypeConflictError
    TypeError
    UnauthorizedError
    UnknownAttributeError
    UnknownMigrationVersionError
    UnprocessedError
    UnsupportedVisitError
    WrongEncodingError
  ```

- digging into unknown action
  ```
  ag 'unknown action' .
  ```
  `actionpack/lib/action_dispatch/middleware/templates/rescues/unknown_action.html.erb`
- what is this middleware
  ```
  bin/rake middleware
  ```
- following docs for
  `activesupport/lib/active_support/actionable_error.rb`
  ```
  class GameController < ApplicationController
    class SomeError < StandardError
      include ActiveSupport::ActionableError
      action 'do this' do
        puts ('✅'*100).split('').join("\n")
        # TODO but draw a snek
        puts `rails generate scaffold Game name:string --force`
      end
    end

    def index
      raise SomeError
    end
  end
  ```

include the <tt>ActiveSupport::ActionableError</tt>
  # module and invoke the +action+

- [x] can you action errors in test mode?
  - no just get a plain old text error
  - [ ] what is missed? how?
- [ ] why can't you see this in production?
- [ ] why do they dissappear with bye bug
- [ ] how to customize the display
- [ ] abuse of actions
- [ ] potential uses of actions with own libraries that need some setup

- [x] first slide not rendering on https://failure-driven.github.io/actionable-errors/
  - problem using Reach Router in mdx-deck v2?
   https://github.com/jxnblk/mdx-deck/blob/master/CHANGELOG.md#v1102-2019-03-10

- wallpaper https://wallpaperplay.com/board/synthwave-wallpapers
  "midnight purple pink cyber punk sun new retro wave"
