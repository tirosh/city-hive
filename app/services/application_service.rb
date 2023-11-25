# ApplicationService provides a common base class for service objects within the application.
#
#
# This class is designed to be reusable across various service objects, offering a standardized
# interface through the `call` method. The `.call` class method allows for convenient invocation
# without the need to instantiate the service explicitly.
#
# Example:
#   class MyService < ApplicationService
#     def call
#       # Implementation specific to MyService
#     end
#   end
#
# Usage:
#   result = MyService.call(params)
#
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
