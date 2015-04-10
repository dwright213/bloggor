module Api
  class UsersController < Api::BaseController

    private

      def artist_params
        params.require(:user).permit(:email)
      end

      def query_params
        params.permit(:email)
      end

  end
end
