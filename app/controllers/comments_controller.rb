class CommentsController < ApplicationController
    # before_action :redirect_if_not_loggedin 

    def new
        @event = Event.find_by_id(params[:event_id])
        @comment = @event.comments.build
    end

    def create
        @comment = current_user.comments.build(comment_params)
        @event = @comment.event
      
        
        if @comment.save
            redirect_to event_path(@event)
        else
            render :new
        end 
    end

    def destroy 
        @comment = Comment.find_by(id: params[:id])
        @event = @comment.event 

        @comment.destroy
        redirect_to event_path(@event)
    end

    private 

    def comment_params
        params.require(:comment).permit(:content, :event_id, :user_id)
    end
end