module Refinery
  module Downloads
    class DownloadsController < ::ApplicationController

      before_filter :find_all_downloads
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @download in the line below:
        present(@page)
      end

      def show
        @download = Download.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @download in the line below:
        present(@page)
      end

    protected

      def find_all_downloads
        @downloads = Download.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/downloads").first
      end

    end
  end
end
