<<<<<<< HEAD
class ApplicationController < ActionController::Base
end

=======
class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
end
>>>>>>> master
