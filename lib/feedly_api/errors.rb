module FeedlyApi
  class Error      < StandardError; end
  class BadRequest < StandardError; end
  class AuthError  < StandardError; end
  class NotFound   < StandardError; end
end
