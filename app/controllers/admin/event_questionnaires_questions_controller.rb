class Admin::EventQuestionnairesQuestionsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_header'
  def new
    @event_questionnaires_question = EventQuestionnairesQuestion.new
  end

  def create
    @event_questionnaires_question =  EventQuestionnairesQuestion.new(event_questionnaires_question_params)
    if @event_questionnaires_question.save
      redirect_to admin_event_questionnaires_questions_path
    else
      render 'new'
    end
  end

  def show
    @event_questionnaires_question = EventQuestionnairesQuestion.find(params[:id])
  end

  def index
    @event_questionnaires_questions = EventQuestionnairesQuestion.all
  end

  private

  def event_questionnaires_question_params
    params.require(:event_questionnaires_question).permit(:title, :content)
  end
end
