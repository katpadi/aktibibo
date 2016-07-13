module Aktibibo
  module Errors
    class AktibiboError < StandardError; end
    class AlreadyActivated < AktibiboError; end
    class AlreadyDeactivated < AktibiboError; end
  end
end