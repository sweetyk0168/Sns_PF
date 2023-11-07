class Public::EventQuestionnairesQuestionsController < ApplicationController
  def new
    @event_questionnaires_question = EventQuestionnairesQuestion.new
  end

  def create
    @event_questionnaires_question = EventQuestionnairesQuestion.new(event_questionnaires_question_params)
    if @event_questionnaires_question.save
    redirect_to complete_ticket_orders_path
    else
      render 'new'
    end
  end


  def event_questionnaires_question_params
    params.require(:event_questionnaires_question).permit(:title, :content)
  end
end
