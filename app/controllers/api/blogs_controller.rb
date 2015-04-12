module Api
  class BlogsController < Api::BaseController

    private

      def blog_params
        params.require(:blog).permit(:title)
      end

      def query_params
        # this assumes that an blog belongs to an user and has an :user_id
        # allowing us to filter by this
        params.permit(:user_id, :title)
      end

  end
end
