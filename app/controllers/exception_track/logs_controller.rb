module ExceptionTrack
  class LogsController < ActionController::Base
    layout 'exception-track/application'
    before_action :set_log, only: [:show, :destroy]

    # GET /exception_logs
    def index
      per_page = params[:per_page] || 15
      @logs = Log.order('id desc').paginate(:page => params[:page], :per_page => per_page)
    end

    # GET /exception_logs/1
    def show
    end

    # DELETE /exception_logs/all
    def all
      Log.delete_all
      redirect_to logs_url, notice: 'Logs was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_log
        @log = Log.find(params[:id])
      end
  end
end
